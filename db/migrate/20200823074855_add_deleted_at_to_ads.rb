class AddDeletedAtToAds < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :deleted_at, :datetime
    add_index :ads, :deleted_at
  end
end
