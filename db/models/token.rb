# frozen_string_literal: true

require_relative "application_record"

class Token < ApplicationRecord
  has_many :invitees, foreign_key: :inviter_id, class_name: "Token"
end
