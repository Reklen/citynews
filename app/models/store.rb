class Store < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :address, :phone
	validates :phone, format: { with: /\d{2}-\d{4}-\d{4}/, message: "bad format" }
	validates :website, :allow_blank => true,
											format: { with: /(http|https):\/\/[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i, message: "bad format" } 
end