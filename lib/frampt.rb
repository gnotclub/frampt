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
      filename = params[:file][:filename]
      file = params[:file][:tempfile]

      # patent pending
      hash = Digest::SHA256.hexdigest(file.read + Time.now.to_s)
                           .split(//)
                           .sample(ENV.fetch("FILENAME_SIZE", 7))
                           .join

      redirect back # TODO: redirect to uploaded file
    end

    not_found do
      "not sure where that is...."
    end
  end
end
