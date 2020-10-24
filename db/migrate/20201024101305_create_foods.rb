class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name,           null: false
      t.string :visited_sauna,  null: false
      t.integer :prefecture_id, null: false
      t.text :description
      t.string :image,          null: false
      t.references :user,                   foreign_key: true
      t.timestamps
      t.timestamps
    end
  end
end
