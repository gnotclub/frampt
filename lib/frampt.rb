# frozen_string_literal: true

require_relative "frampt/version"
require "sinatra/base"

module Frampt
  class Error < StandardError; end

  # Frampt App
  class App < Sinatra::Application
    get "/" do
      erb :index
    end

    post "/upload" do
      @filename = params[:file][:filename]
      file = params[:file][:tempfile]

      File.open("./public/#{filename}", "wb") do |rawfile|
        rawfile.write(file.read)
      end

      redirect back # TODO: redirect to uploaded file
    end

    not_found do
      "not sure where that is...."
    end
  end
end
