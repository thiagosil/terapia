class AddRoleToPerson < ActiveRecord::Migration
  def change
    add_column :people, :first_role, :string
    add_column :people, :second_role, :string
    remove_column :people, :accompanist
  end
end
