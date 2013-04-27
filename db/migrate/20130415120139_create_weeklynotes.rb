class CreateWeeklynotes < ActiveRecord::Migration
  def change
    create_table :weeklynotes do |t|
      t.integer :user_id
      t.text :note
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
