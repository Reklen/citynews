class Article < ActiveRecord::Base
  # searchkick
  # scope :search_import, -> { includes(:picture, :location) }

  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :picture

  validates_presence_of :title, :description

  after_commit :reindex_article

  searchkick mappings: {
    article: {
      properties: {
        title: { type: "string" },
        location: {
          type: "nested",
          properties: {
            latitude: { type: "float" },
            location: { type: "float" },
            city: { type: "string" },
            state: { type: "string" },
            country: { type: "string" }
          }
        },
        picture: {
          type: "nested",
          properties: {
            photo_file_name: { type: "string" }
          }
        }
      }
    }
  }

  def search_data
    {
      title: title,
      location: {
        latitude: location.latitude,
        longitude: location.longitude,
        city: location.city,
        state: location.state,
        country: location.country
      },
      picture: {
        photo_file_name: picture.photo_file_name
      }
    }
  end

  def reindex_article
    Article.reindex # or reindex_async
  end
end