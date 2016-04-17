class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.boolean :is_quality, default: false
      t.timestamps null: false
    end
  end
end
