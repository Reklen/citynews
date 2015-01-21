class RemoveLikeDislike < ActiveRecord::Migration
  def change
  	remove_column :articles, :like 
  	remove_column :articles, :dislikes
  	remove_column :promotions, :like
  	remove_column :promotions, :dislike
  end
end

