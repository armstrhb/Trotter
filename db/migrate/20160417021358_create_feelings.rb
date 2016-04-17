class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.string :name, null: false
      t.boolean :positive, default: false
      t.timestamps null: false
    end
  end
end
