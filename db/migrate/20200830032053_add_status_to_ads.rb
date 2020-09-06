class AddStatusToAds < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :status, :integer
  end
end
