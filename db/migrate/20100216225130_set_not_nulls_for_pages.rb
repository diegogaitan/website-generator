class SetNotNullsForPages < ActiveRecord::Migration
  def self.up
      change_column :pages, :name, :string, :null => true
      change_column :pages, :title, :string, :null => true
      change_column :pages, :description, :string, :null => true
      change_column :pages, :main_keyword, :string, :null => true
      change_column :pages, :keyword2, :string, :null => true
      change_column :pages, :keyword3, :string, :null => true
      change_column :pages, :htwo_header, :string, :null => true
      change_column :pages, :first_paragraph, :string, :null => true
  end

  def self.down
      change_column :pages, :name, :string, :null => false
      change_column :pages, :title, :string, :null => false
      change_column :pages, :description, :string, :null => false
      change_column :pages, :main_keyword, :string, :null => false
      change_column :pages, :keyword2, :string, :null => false
      change_column :pages, :keyword3, :string, :null => false
      change_column :pages, :htwo_header, :string, :null => false
      change_column :pages, :first_paragraph, :string, :null => false
  end
end
