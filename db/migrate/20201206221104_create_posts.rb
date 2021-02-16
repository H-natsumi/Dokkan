class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.string :bookname
      t.text :content
      t.text :explain
      t.string :janl
      t.text :comment

      t.timestamps
    end
  end
end
