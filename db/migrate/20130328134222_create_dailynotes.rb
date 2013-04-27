class CreateDailynotes < ActiveRecord::Migration
  def change
    create_table :dailynotes do |t|
      t.integer :user_id, :null => false
      t.text :note
      t.datetime :date, :null => false

      t.timestamps
    end
  end
end
