class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :card_number, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :valid_year, null: false, default: ""
      t.string :valid_month, null: false, default: ""
      t.string :security_code, null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
