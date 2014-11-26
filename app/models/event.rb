class Event < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :date, :title, :description
end