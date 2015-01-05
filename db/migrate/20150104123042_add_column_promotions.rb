class AddColumnPromotions < ActiveRecord::Migration
  def change
  	remove_column :promotions, :photo
  	add_attachment :promotions, :photo
  end
end
