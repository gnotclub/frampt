# frozen_string_literal: true

require "sinatra/base"
require "digest"
require "active_record"
require "active_support"
require "pg"
require "yaml"
require "erb"

require_relative "frampt/version"
require_relative "../db/models/Upload"
require_relative "../db/models/Uploader"

module Frampt
  class Error < StandardError; end

  # Frampt App
  class App < Sinatra::Application
    configure do
      app_env = ENV.fetch("APP_ENV", "developemnt")
      ActiveRecord.schema_format = :sql
      ActiveRecord::Base.logger = Logger.new($stdout)
      ActiveRecord::Base.configurations = YAML.safe_load(ERB.new(File.read("config/database.yml")).result,
                                                         aliases: true)
      ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations.find_db_config(app_env))
    end

    get "/" do
      erb :index
    end

    post "/upload" do
      uploaded_file = params[:file][:tempfile]

      # patent pending
      hash = Digest::SHA256.hexdigest(uploaded_file.read + Time.now.to_s)
                           .split(//)
                           .sample(ENV.fetch("FILENAME_SIZE", 7))
                           .join

      ext = File.extname(uploaded_file.path).delete(".")
      filename = "#{hash}.#{ext}"

      # reset seek back to 0 to prep for actual upload
      uploaded_file.seek 0

      File.open("./public/#{filename}", "wb") do |file|
        file.write(uploaded_file.read)
      end

      user = Uploader.find_or_create_by(ip: request.ip, session: session[:session_id].to_s)

      Upload.create(name: hash, filetype: ext, uploader: user)

      to("/#{filename}")
    end

    get "/*.*" do |filename, ext|
      # lul
      return redirect(to(not_found)) if filename == "favicon" && ext == "ico"

      upload = Upload.find_by(name: filename, filetype: ext)

      upload.present? ? send_file("./public/#{upload.filename}") : redirect(to(not_found))
    end

    not_found do
      "not sure where that is...."
    end
  end
end
