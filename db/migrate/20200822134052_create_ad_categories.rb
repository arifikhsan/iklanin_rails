class CreateAdCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :ad_categories do |t|
      t.references :ad, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
