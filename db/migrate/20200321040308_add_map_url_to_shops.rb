class AddMapUrlToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :map_url, :text
  end
end
