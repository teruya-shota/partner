class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.references :room, foreign_key: true
      t.references :language, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
