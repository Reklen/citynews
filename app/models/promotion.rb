class Promotion < ActiveRecord::Base
	belongs_to :store
	validates_presence_of :title, :description, :price
	validates :price, numericality: true
end