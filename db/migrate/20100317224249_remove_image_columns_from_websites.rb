class RemoveImageColumnsFromWebsites < ActiveRecord::Migration
  def self.up
    remove_column :websites, :image1
    remove_column :websites, :image2
    remove_column :websites, :image3
    remove_column :websites, :image4
  end

  def self.down
    add_column :websites, :image1, :string
    add_column :websites, :image2, :string
    add_column :websites, :image3, :string
    add_column :websites, :image4, :string
  end
end
