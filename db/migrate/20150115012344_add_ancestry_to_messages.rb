class AddAncestryToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :ancestry, :string
    add_index :messages, :ancestry
  end

  def down
    remove_column :messages, :ancestry, :string
    remove_index :messages, :ancestry
  end
end
