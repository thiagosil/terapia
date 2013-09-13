class RemoveReligionFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :religion
  end
end
