class CreateItemImages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_images do |t|
      t.references :item, null: false, foreign_key: true
      t.boolean :cover, default: false
      t.string :name
      t.string :detail

      t.timestamps
    end
  end
end
