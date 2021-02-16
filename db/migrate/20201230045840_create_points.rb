class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :battle_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
