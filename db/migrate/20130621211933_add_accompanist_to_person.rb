class AddAccompanistToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.string :accompanist
    end
  end
end
