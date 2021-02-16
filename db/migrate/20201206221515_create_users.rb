class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :password
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
