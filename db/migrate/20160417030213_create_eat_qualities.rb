class CreateEatQualities < ActiveRecord::Migration
  def change
    create_table :eat_qualities do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
