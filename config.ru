# frozen_string_literal: true

require "rack/protection"
require_relative "lib/frampt"

# fetch stuff from .env if we are running locally
unless ENV.fetch("APP_ENV", "development") == "production"
  require "dotenv/load"
  require "debug"
end

# use cookies for session data
# we dont have user accounts, but still might be
# useful to have some state for something
use Rack::Session::Cookie, secret: ENV.fetch("SESSION_COOKIE_SECRET"), key: "framptsesh"

use Rack::Protection

# CSRF protection
use Rack::Protection::AuthenticityToken
use Rack::Protection::FormToken
use Rack::Protection::RemoteReferrer

# XSS protection
use Rack::Protection::EscapedParams

# cookie tossing lmao i love that one
# what does it even mean to toss a cookie KA BAM toss that shit LOL
use Rack::Protection::CookieTossing

# protocol downgrade attack and cookie hijacks
use Rack::Protection::StrictTransport

run Frampt::App
