class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.belongs_to :user
    	t.date :date, null: false
    	t.string :title, null: false
    	t.text :description, null: false
    	t.string :photo
    	t.timestamp
    end
  end
end
