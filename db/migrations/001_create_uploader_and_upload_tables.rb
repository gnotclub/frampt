class CreateUploaderAndUploadTables < ActiveRecord::Migration[7.0]
  def change
    create_table :uploaders, id: :uuid do |table|
      table.string :ip, null: false
      table.string :session, null: false

      table.timestamps

      table.index :ip
    end

    create_table :uploads, id: :uuid do |table|
      table.string :name, null: false
      table.string :filetype, null: false
      table.references :uploader, type: :uuid, index: true, null: false

      table.timestamps
    end
  end
end
