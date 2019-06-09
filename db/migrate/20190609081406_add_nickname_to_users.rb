class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile, :text
    add_column :users, :icon, :string
  end
end
