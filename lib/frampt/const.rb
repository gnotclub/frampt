# frozen_string_literal: true

module Frampt::Const
  PRODUCTION = ENV.fetch("APP_ENV", "development") == "production"
end
