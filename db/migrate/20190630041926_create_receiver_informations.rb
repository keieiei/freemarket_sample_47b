class CreateReceiverInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :receiver_informations do |t|
      t.string :family_name, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :family_name_kana, null: false, default: ""
      t.string :first_name_kana, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.integer :prefecture, null: false, default: 0
      t.string :city, null: false, default: ""
      t.string :street, null: false, default: ""
      t.string :building
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
