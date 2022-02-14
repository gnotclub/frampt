# frozen_string_literal: true

require_relative "application_record"

# record of a file upload
class Upload < ApplicationRecord
  belongs_to :uploader

  def filename
    "#{name}.#{filetype}"
  end
end
