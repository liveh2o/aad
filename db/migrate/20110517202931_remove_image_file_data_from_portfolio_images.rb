class RemoveImageFileDataFromPortfolioImages < ActiveRecord::Migration
  def self.up
    remove_column :portfolio_images, :image_file_data
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
