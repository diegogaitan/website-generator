class RemoveIsHomePageFromPages < ActiveRecord::Migration
  def self.up
    remove_column :pages, :is_home_page
  end

  def self.down
    add_column :pages, :is_home_page, :boolean, :default => false
  end
end
