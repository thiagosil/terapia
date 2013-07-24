class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.belongs_to :family

      t.timestamps
    end
  end
end
