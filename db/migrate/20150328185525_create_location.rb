class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :locationable, polymorphic: true, index: true
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
