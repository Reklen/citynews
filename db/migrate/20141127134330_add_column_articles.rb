class AddColumnArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :photo, :string
  end
end
