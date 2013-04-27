class AddWeeklynoteIdToDailynotes < ActiveRecord::Migration
  def change
    add_column :dailynotes, :weeklynote_id, :integer
  end
end
