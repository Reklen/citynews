class Article < ActiveRecord::Base
  searchkick
  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :picture

  validates_presence_of :title, :description

  # def search_data(lat, long)
  #   Article.search '*', where: {location: {near: [10, 10], within: "10000mi"}}
  # end
end