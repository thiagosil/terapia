class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :cpf
      t.string :first_role
      t.string :second_role
      t.string :company
      t.belongs_to :family
      t.string :parish
      t.string :community
      t.string :pastoral

      t.timestamps
    end
  end
end
