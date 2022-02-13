# frozen_string_literal: true

require_relative "frampt/version"
require "sinatra/base"
require "digest"

module Frampt
  class Error < StandardError; end

  # Frampt App
  class App < Sinatra::Application
    get "/" do
      erb :index
    end

    post "/upload" do
      uploaded_filename = params[:file][:filename]
      uploaded_file = params[:file][:tempfile]

      # patent pending
      hash = Digest::SHA256.hexdigest(uploaded_file.read + Time.now.to_s)
                           .split(//)
                           .sample(ENV.fetch("FILENAME_SIZE", 7))
                           .join

      ext = File.extname(uploaded_file.path)
      filename = "#{hash}#{ext}"

      # reset seek back to 0 to prep for actual upload
      uploaded_file.seek 0

      File.open("./public/#{filename}", "wb") do |file|
        file.write(uploaded_file.read)
      end

      redirect to("/#{filename}")
    end

    get "/:filename" do
      filename = params[:filename]

      send_file "./public/#{filename}"
    end

    not_found do
      "not sure where that is...."
    end
  end
end
