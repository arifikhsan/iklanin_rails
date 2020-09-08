class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :key
      t.string :value
      t.text :detail

      t.timestamps
    end
  end
end
