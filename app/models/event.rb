class Event < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, as: :imageable

	validates_presence_of :date, :title, :description
end