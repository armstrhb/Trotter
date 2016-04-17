class CreateNoiseLevelDescriptions < ActiveRecord::Migration
  def change
    create_table :noise_level_descriptions do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
