class Article < ActiveRecord::Base
  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :picture, :location

  validates_presence_of :title, :description

  # after_save :reindex_article
  # after_destroy :reindex_article

  searchkick merge_mappings: true, mappings: {
    article: {
      dynamic: 'strict',
      properties: {
        id: { type: 'integer' },
        title: { type: 'string' },
        photo_url: { type: 'string' },
        author_name: { type: 'string' },
        author_picture: { type: 'string'},
        city: { type: 'string' },
        state: { type: 'string' },
        country: { type: 'string' },
        location: { type: 'geo_point' },
        date: { type: 'date' }
      }
    }
  }

  def search_data
    {
      id: id,
      title: title,
      photo_url: picture.photo.url(:medium),
      author_name: user.name,
      author_picture: user.image,
      city: location.city,
      state: location.state,
      country: location.country,
      location: {
        lat: location.latitude,
        lon: location.longitude
      },
      date: updated_at
    }
  end

  def reindex_article
    Article.reindex # or reindex_async
  end

  def self.search_by_location(lat, lon, distance)
    articles = Article.search('*', load: false,
      where: {
        location: {
          near: [lat, lon],
          within: distance
        }
      },
      sort: {
        created_at: {
          order: 'desc'
        }
      }
    )
    articles.to_json(except: [:_id, :_index, :_type, :_score])
  end

end