class AddDateToBattle < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :date, :date 
  end
end
