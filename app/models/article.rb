class Article < ActiveRecord::Base
  searchkick
  belongs_to :user
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture

  validates_presence_of :title, :description
end