class CreatePromotion < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
    	t.belongs_to :store
    	t.string :title, null: false
    	t.string :description, null: false
    	t.integer :price, null: false
    	t.string :photo
    	t.integer :like, default: 0
    	t.integer :dislike, default: 0

    	t.timestamps
    end
  end
end
