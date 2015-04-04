class Article < ActiveRecord::Base
  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :picture

  validates_presence_of :title, :description
  after_commit :reindex_article

  searchkick merge_mappings: true, mappings: {
    article: {
      dynamic: 'strict',
      properties: {
        id: { type: 'integer' },
        title: { type: 'string' },
        author_name: { type: 'string' },
        author_picture: { type: 'string'},
        latitude: { type: 'float' },
        longitude: { type: 'float' },
        city: { type: 'string' },
        state: { type: 'string' },
        country: { type: 'string' },
        photo_url: { type: 'string' }
      }
    }
  }

  def search_data
    {
      id: id,
      title: title,
      author_name: user.name,
      author_picture: user.image,
      latitude: location.latitude,
      longitude: location.longitude,
      city: location.city,
      state: location.state,
      country: location.country,
      photo_url: picture.photo.url(:medium)
    }
  end

  def reindex_article
    Article.reindex # or reindex_async
  end

  def self.search_by_location
    articles = Article.search('vitae', load: false).to_json(root: true, except:[:_id, :_index, :_type, :_score, :latitude, :longitude])
  end

end