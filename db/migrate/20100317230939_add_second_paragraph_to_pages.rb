class AddSecondParagraphToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :second_paragraph, :string
  end

  def self.down
    remove_column :pages, :second_paragraph, :string
  end
end
