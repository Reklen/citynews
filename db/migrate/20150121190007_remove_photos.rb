class RemovePhotos < ActiveRecord::Migration
  def change
    remove_attachment :articles, :photo
    remove_attachment :events, :photo
    remove_attachment :promotions, :photo
  end
end
