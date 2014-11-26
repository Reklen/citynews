class CreateCityComment < ActiveRecord::Migration
  def change
    create_table :city_comments do |t|
    	t.belongs_to :user, null: false
    	t.string :title, null: false
    	t.boolean :comment_type, null: false
    	t.text :description, null: false
    	t.timestamp
    end
  end
end
