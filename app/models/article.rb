class Article < ActiveRecord::Base
  searchkick
  belongs_to :user
  has_one :picture, as: :imageable
  has_one :location, as: :locationable

  accepts_nested_attributes_for :picture

  validates_presence_of :title, :description
end