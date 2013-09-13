class RemoveFriendFieldsFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :cpf
    remove_column :people, :first_role
    remove_column :people, :second_role
    remove_column :people, :company
    remove_column :people, :family_id
  end
end
