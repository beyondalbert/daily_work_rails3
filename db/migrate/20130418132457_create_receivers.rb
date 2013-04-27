class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :nickname
      t.string :email
      t.integer :user_id, :null => false
      t.integer :contact_type, :null => false

      t.timestamps
    end
  end
end
