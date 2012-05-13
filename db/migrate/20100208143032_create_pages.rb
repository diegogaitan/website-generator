class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.column :name, :string, :null => false
      t.column :title, :string, :null => false
      t.column :description, :string, :null => false
      t.column :main_keyword, :string, :null => false
      t.column :keyword2, :string, :null => false
      t.column :keyword3, :string, :null => false
      t.column :htwo_header, :string, :null => false
      t.column :first_paragraph, :text, :null => false
      t.column :is_home_page, :boolean, :default => false
      t.column :website_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
