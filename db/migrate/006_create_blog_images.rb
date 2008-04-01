class CreateBlogImages < ActiveRecord::Migration
  def self.up
    create_table :blog_images do |t|
      t.column :data, :binary, :size => 10_000_000, :null => false
      t.column :post_id, :integer
      
      #Add other fields here
      #  t.column :name, :string
    end
    execute "ALTER TABLE `blog_images` MODIFY `data` MEDIUMBLOB"
  end

  def self.down
    drop_table :blog_images
  end
end
