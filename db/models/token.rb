# frozen_string_literal: true

require_relative "application_record"

class Token < ApplicationRecord
  # user who invited uploader
  belongs_to :invitee

  # uploader who owns this token
  belongs_to :uploader
end
