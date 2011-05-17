class RenameDataOnPortfolio < ActiveRecord::Migration
  def self.up
    rename_column :portfolio_images, :data, :image_file_data
  end

  def self.down
    rename_column :portfolio_images, :image_file_data, :data
  end
end
