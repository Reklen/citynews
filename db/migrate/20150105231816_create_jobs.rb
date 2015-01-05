class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :salary, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
