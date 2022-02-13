require_relative "application_record"

class Uploader < ApplicationRecord
  has_many :uploads
end
