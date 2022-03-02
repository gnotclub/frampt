# frozen_string_literal: true

require_relative "application_record"

class Uploader < ApplicationRecord
  has_many :uploads
  has_one :token

  has_many :invitees, through: :token
end
