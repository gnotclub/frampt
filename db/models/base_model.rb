require "sequel"

module Db
  module Models
    class BaseModel < Sequel::Model
      plugin :timestamps
    end
  end
end
