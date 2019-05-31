class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.references :room, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.boolean :read, null: false, default: false

      t.timestamps null: false
    end
  end
end
