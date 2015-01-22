class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.references :imageable, polymorphic: true, index: true
    	t.timestamps null: false
    end

    add_attachment :pictures, :photo
  end
end
