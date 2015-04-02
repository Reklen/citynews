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
        author_name: { type: "string" },
        author_picture: { type: "string"},
        title: { type: "string" },
        latitude: { type: "float" },
        location: { type: "float" },
        city: { type: "string" },
        state: { type: "string" },
        country: { type: "string" },
        photo_file_name: { type: "string" }
      }
    }
  }

  def search_data
    {
      author_name: user.image,
      author_picture: user.name,
      title: title,
      latitude: location.latitude,
      longitude: location.longitude,
      city: location.city,
      state: location.state,
      country: location.country,
      photo_file_name: picture.photo.url(:medium)
    }
  end

  def reindex_article
    Article.reindex # or reindex_async
  end
end