class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.column :domain, :string, :null => false
      t.column :image1, :string
      t.column :image2, :string
      t.column :image3, :string
      t.column :image4, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :websites
  end
end
