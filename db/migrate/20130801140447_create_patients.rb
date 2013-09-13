class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :psychologist
      t.string :frequency
      t.string :payment_form
      t.string :payment_terms
      t.string :pray_followed
      t.string :duo_in_charge
      t.string :day_care
      t.string :religion
      t.string :observation

      t.timestamps
    end
  end
end
