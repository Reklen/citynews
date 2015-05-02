class Event < ActiveRecord::Base
  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :picture, :location

  validates_presence_of :title, :description, :date

  searchkick merge_mappings: true, mappings: {
    event: {
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
      date: date
    }
  end

  def self.search_by_location(latitude, longitude, distance)
    lat = latitude.to_f
    lon = longitude.to_f
    distance_str = "#{distance}km"

    events = Event.search('*', load: false,
      where: {
        location: {
          near: [lat, lon],
          within: distance_str
        }
      },
      sort: { created_at: { order: 'desc' } }
    )

    events.as_json(except: [:_id, :_index, :_type, :_score])
  end
end
