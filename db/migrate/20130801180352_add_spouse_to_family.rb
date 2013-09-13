class AddSpouseToFamily < ActiveRecord::Migration
  def change
    add_column :families, :spouse, :string
  end
end
