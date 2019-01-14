class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :name
      t.integer :answer_id
      t.boolean :learned
      t.integer :category_id

      t.timestamps
    end
  end
end
