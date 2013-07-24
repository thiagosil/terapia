class AddChildrenToPerson < ActiveRecord::Migration
  def change
    add_column :people, :children, :integer
  end
end
