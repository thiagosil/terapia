class RemoveParishFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :parish, :string
    remove_column :people, :community, :string
    remove_column :people, :pastoral, :string
  end
end
