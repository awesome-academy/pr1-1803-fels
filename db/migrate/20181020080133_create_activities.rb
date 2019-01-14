class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :activity_type
      t.integer :object_id
      t.integer :action_type

      t.timestamps
    end
  end
end
