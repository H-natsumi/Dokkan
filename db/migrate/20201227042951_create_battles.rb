class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.integer :p1_id
      t.string :p1_book
      t.text :p1_body
      t.integer :p2_id
      t.string :p2_book
      t.text :p2_body

      t.timestamps
    end
  end
end
