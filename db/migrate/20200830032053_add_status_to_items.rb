class AddStatusToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :status, :integer
  end
end
