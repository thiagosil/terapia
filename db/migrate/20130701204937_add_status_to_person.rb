class AddStatusToPerson < ActiveRecord::Migration
  def change
    add_column :people, :active, :boolean
    add_column :people, :cpf, :string
    add_column :people, :blood_type, :string
  end
end
