class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
