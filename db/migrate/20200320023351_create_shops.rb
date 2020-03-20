class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :store_name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :open_hour, null: false
      t.text :image, null: false

      t.timestamps
    end
  end
end
