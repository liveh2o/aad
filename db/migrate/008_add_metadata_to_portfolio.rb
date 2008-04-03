class AddMetadataToPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolio_images, :metadata, :text
  end

  def self.down
    remove_column :portfolio_images, :metadata
  end
end
