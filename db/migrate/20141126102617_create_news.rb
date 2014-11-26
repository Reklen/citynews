class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.belongs_to :user, null: false
    	t.string :title, null: false
    	t.string :description, null: false
    	t.integer :like, default: 0
    	t.integer :dislikes, default: 0
    	t.timestamp
    end
  end
end
