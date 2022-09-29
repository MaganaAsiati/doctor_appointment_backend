class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name, :limit=>50
      t.string :speciality, :limit=>100
      t.string :image
      t.boolean :reserved
      t.text :description
      t.decimal :bill
      t.string :email
      t.string :location, :limit=>100

      t.timestamps
    end
  end
end
