class RemoveDurationColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :duration
  end
end
