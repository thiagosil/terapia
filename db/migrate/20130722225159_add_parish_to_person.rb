class AddParishToPerson < ActiveRecord::Migration
  def change
    add_column :people, :parish, :string
    add_column :people, :community, :string
    add_column :people, :pastoral, :string
  end
end
