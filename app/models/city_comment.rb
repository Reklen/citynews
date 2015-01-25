class CityComment < ActiveRecord::Base
	belongs_to :user
	has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture

	validates_presence_of :title, :description, :comment_type
	validates :comment_type, inclusion: { in: [true, false] }
end