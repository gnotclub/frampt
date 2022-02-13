require_relative "application_record"

class Upload < ApplicationRecord
  belongs_to :uploader

  def filename
    "#{name}.#{filetype}"
  end
end
