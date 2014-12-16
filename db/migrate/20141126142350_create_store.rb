class CreateStore < ActiveRecord::Migration
  def change
    create_table :stores do |t|
    	t.belongs_to :user, null: false
    	t.string :name, null: false
    	t.string :address, null: false
    	t.string :phone, null: false
    	t.string :website
    	t.string :picture_path

    	t.timestamps
    end
  end
end
