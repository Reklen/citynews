class Event < ActiveRecord::Base
	belongs_to :user
	has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture


	validates_presence_of :date, :title, :description
end