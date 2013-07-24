class RenameFamilyChildren < ActiveRecord::Migration
  def change
    change_table :families do |t|
      t.rename :children, :number_of_children
    end
  end
end
