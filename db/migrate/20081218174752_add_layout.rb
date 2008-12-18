class AddLayout < ActiveRecord::Migration
  def self.up
    add_column :fts_settings, :layout, :string
  end

  def self.down
    remove_column :fts_settings, :layout
  end
end
