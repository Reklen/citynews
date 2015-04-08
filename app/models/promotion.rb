class Promotion < ActiveRecord::Base
  belongs_to :user

  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :picture, :location

  validates_presence_of :title, :description, :price
  validates :price, numericality: true
end