class AddGenderToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.string :gender
    end
  end
end
