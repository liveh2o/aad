class CreatePortfolioImages < ActiveRecord::Migration
  def self.up
    create_table :portfolio_images do |t|
      t.column :data, :binary, :size => 10_000_000, :null => false
      
      #Add other fields here
      t.column :title, :string
    end
    execute "ALTER TABLE `portfolio_images` MODIFY `data` MEDIUMBLOB"
  end

  def self.down
    drop_table :portfolio_images
  end
end
