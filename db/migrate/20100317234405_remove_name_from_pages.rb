class RemoveNameFromPages < ActiveRecord::Migration
  def self.up
    remove_column :pages, :name
  end

  def self.down
    add_column :pages, :name, :string
  end
end
