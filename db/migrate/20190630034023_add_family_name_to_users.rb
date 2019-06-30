class AddFamilyNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :nickname, unique: true
    add_column :users, :family_name, :string, null: false, default: ""
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :family_name_kana, :string, null: false, default: ""
    add_column :users, :first_name_kana, :string, null: false, default: ""
    add_column :users, :birth_year, :integer, null: false, default: 0
    add_column :users, :birth_month, :integer, null: false, default: 0
    add_column :users, :birth_day, :integer, null: false, default: 0
    add_column :users, :phone_number, :string, null: false, default: ""
  end
  def up
    change_column_null :users, :nickname, false, ""
  end
  def down
    change_column_null :users, :nickname, true, nil
  end
end
