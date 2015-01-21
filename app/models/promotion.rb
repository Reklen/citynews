class Promotion < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, as: :imageable
	
	validates_presence_of :title, :description, :price
	validates :price, numericality: true
end