class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.datetime :date
      t.text :content
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
