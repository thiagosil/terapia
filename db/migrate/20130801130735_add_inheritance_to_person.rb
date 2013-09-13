class AddInheritanceToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :personifiable_id
      t.string  :personifiable_type
    end
  end
end
