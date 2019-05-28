class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0
      t.text :image_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
