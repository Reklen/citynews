class CityComment < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :description, :comment_type
	validates :comment_type, inclusion: { in: [true, false] }
end