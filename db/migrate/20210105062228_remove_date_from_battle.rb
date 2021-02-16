class RemoveDateFromBattle < ActiveRecord::Migration[5.2]
  def change
    remove_column :battles, :date, :date
  end
end
