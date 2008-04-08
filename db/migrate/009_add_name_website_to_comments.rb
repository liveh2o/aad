class AddNameWebsiteToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :name, :string
    add_column :comments, :url, :string
  end

  def self.down
    remove_column :comments, :name
    remove_column :comments, :url
  end
end
