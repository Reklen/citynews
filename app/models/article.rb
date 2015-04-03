class Article < ActiveRecord::Base
  # searchkick
  # scope :search_import, -> { includes(:picture, :location) }
  searchkick merge_mappings: true, mappings: {
    article: {
      dynamic: 'strict',
      properties: {
        author_name: { type: 'string' },
        author_picture: { type: 'string'},
        id: { type: 'integer' },
        title: { type: 'string' },
        latitude: { type: 'float' },
        longitude: { type: 'float' },
        city: { type: 'string' },
        state: { type: 'string' },
        country: { type: 'string' },
        photo_file_name: { type: 'string' }
      }
    }
  }

  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :picture

  validates_presence_of :title, :description

  after_commit :reindex_article

  def search_data
    {
      author_name: user.image,
      author_picture: user.name,
      id: id,
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