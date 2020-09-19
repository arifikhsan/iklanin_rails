class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :whatsapp_phone_number
      t.string :address
      t.string :village
      t.string :district
      t.string :regency
      t.string :province
      t.string :zip_code
      t.date   :dob
      t.integer :gender

      t.timestamps
    end
  end
end
