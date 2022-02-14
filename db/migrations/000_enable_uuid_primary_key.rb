# frozen_string_literal: true

require "active_record"

# confirm that pgcrypto postgres extension is enabled
# to be able to use id as primary key type
class EnableUuidPrimaryKey < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")
  end
end
