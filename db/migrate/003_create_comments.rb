class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :email_address, :string
      t.column :body, :text
      t.column :active, :boolean, :default => true
      t.column :posted_on, :datetime
      t.column :post_id, :integer
    end
  end

  def self.down
    drop_table :comments
  end
end
