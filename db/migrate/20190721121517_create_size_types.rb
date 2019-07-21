class CreateSizeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :size_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
