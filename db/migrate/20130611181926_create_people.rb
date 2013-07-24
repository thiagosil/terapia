class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date   :birthday
      t.string :telephone

      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :religion
      t.string :literacy
      t.string :email
      t.string :cellphone
      t.string :company
      t.string :position
      t.string :marital_status
      t.string :drugs
      t.string :allergies
      t.string :postal_code
      t.string :identity
      t.string :identity_issuer
      t.date   :identity_expedition_date
      t.string :type
      t.date   :beginning_date
      t.date   :end_date

      t.timestamps
    end
  end
end