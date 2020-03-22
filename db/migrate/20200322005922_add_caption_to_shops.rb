class AddCaptionToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :caption, :string
  end
end
