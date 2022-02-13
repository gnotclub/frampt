require "sequel"

Sequel.migration do
  up do
    create_table(:uploaders) do
      column :id, :uuid, primary_key: true, index: true, null: false, default: SecureRandom.uuid, unique: true
      column :ip, :string, index: true, null: true
    end

    create_table(:uploads) do
      column :id, :uuid, primary_key: true, index: true, null: false, default: SecureRandom.uuid, unique: true
      column :name, :string, index: true, unique: true, null: false
      foreign_key :uploader_id, :uploaders, index: true, on_delete: :cascade
    end
  end
end
