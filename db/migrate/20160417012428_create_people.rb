class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.date :birthday
      t.string :relationship_description
      t.text :notes
      t.timestamps null: false
    end
  end
end
