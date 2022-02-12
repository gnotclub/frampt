# frozen_string_literal: true

require_relative "frampt/version"
require "sinatra/base"

module Frampt
  class Error < StandardError; end

  class App < Sinatra::Application
    get "/" do
      erb :index
    end
  end
end
