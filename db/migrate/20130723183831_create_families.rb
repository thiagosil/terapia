class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :mother
      t.string :father
      t.integer :children

      t.timestamps
    end

    add_column :people, :family_id, :integer
  end
end
