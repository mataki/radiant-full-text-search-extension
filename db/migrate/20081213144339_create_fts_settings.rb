class CreateFtsSettings < ActiveRecord::Migration
  def self.up
    create_table :fts_settings do |t|
      t.string :node

      t.timestamps
    end
  end

  def self.down
    drop_table :fts_settings
  end
end
