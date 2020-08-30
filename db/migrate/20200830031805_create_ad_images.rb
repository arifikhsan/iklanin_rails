class CreateAdImages < ActiveRecord::Migration[6.0]
  def change
    create_table :ad_images do |t|
      t.references :ad, null: false, foreign_key: true
      t.boolean :cover, default: false

      t.timestamps
    end
  end
end
