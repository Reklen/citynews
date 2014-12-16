class AddColumnPhotoArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :photo
  	add_attachment :articles, :photo
  end
end
