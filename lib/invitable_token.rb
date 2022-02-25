# frozen_string_literal: true

require "jwt"

JWT_TOKEN_HMAC = ENV.fetch("TOKEN_HMAC")
PROTECTED_ROUTES = [
  "/upload",
  "/invite"
].freeze

class InvalidTokenError < StandardError; end;

# middleware to check that invitabletoken is valid
class InvitableToken
  def initialize(app)
    @app = app
  end

  def validate(jwt)
    JWT.decode(jwt, JWT_TOKEN_HMAC, true, algorithm: "HS512")
  rescue JWT::DecodeError, JWT::VerificationError
    raise InvalidTokenError.new
  end

  def call(env)
    s, headers, b = @app.call(env)

    return [s, headers, b] unless PROTECTED_ROUTES.include?(env["REQUEST_PATH"])

    jwt = headers["Authorization"].split(" ").last
    validate(jwt)
    [s, headers, b]
  rescue
    [401, {}, nil]
  end
end
