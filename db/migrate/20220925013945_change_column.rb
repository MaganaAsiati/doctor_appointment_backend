class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :doctors, :reserved, :boolean, :default => false
  end
end
