# frozen_string_literal: true

require_relative "frampt/version"
require "sinatra/base"

module Frampt
  class Error < StandardError; end

  class App < Sinatra::Application
    get "/" do
      erb :index
    end

    not_found do
      "not sure where that is...."
    end
  end
end
