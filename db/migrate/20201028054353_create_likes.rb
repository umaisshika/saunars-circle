class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, index: false
      t.references :food, foreign_key: true, index: false
      t.timestamps
    end
  end
end
