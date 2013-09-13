class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :parish
      t.string :community
      t.string :pastoral
      
      t.timestamps
    end
  end
end
