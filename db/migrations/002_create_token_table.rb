# frozen_string_literal: true

# create token table
class CreateTokenTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens, id: :uuid do |table|
      table.string :token
      table.references :invitee, type: :uuid, index: true, null: true

      table.timestamps
    end
  end
end
