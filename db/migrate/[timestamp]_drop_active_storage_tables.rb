class DropActiveStorageTables < ActiveRecord::Migration[7.1]
  def up
    execute 'DROP TABLE IF EXISTS active_storage_attachments CASCADE'
    execute 'DROP TABLE IF EXISTS active_storage_variant_records CASCADE'
    execute 'DROP TABLE IF EXISTS active_storage_blobs CASCADE'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end 
