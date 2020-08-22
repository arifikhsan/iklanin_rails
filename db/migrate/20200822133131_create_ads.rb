class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.text :detail
      t.bigint :price
      t.datetime :time_start
      t.datetime :time_end
      t.boolean :active

      t.timestamps
    end
  end
end
