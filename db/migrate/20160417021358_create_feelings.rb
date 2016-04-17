class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.string :name
      t.boolean :positive
      t.timestamps null: false
    end
  end
end
