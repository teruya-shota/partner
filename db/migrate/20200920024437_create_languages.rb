class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :area, null: false
      t.text :usage, null: false
      t.timestamps
    end
  end
end
