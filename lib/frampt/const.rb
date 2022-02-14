# frozen_string_literal: true

module Frampt
  module Const
    PRODUCTION = ENV.fetch("APP_ENV", "development") == "production"
  end
end
