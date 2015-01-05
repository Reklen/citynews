class RemovePromotionStoreId < ActiveRecord::Migration
  def change
  	remove_column :promotions, :store_id
  	add_column :promotions, :user_id, :integer
  end
end
