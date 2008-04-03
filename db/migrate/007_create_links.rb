class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.column :name, :string
      t.column :url, :string
      t.column :alt, :string
      t.column :position, :integer
    end
    
    Link.create(
      :name => "Photography",
      :url => "http://www.flickr.com/photos/arthurdesign/",
      :position => 1
    )

    Link.create(
      :name => "Store",
      :url => "http://astore.amazon.com/arthursdesign-20/002-6271291-8800030",
      :position => 2
    )
    
  end

  def self.down
    drop_table :links    
  end
end
