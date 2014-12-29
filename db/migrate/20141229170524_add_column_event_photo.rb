class AddColumnEventPhoto < ActiveRecord::Migration
  def change
  	remove_column :events, :photo
  	add_attachment :events, :photo
  end
end
