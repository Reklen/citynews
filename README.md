**CityNews** is a webapp made to share news and events all arround the world. By just selecting an area in the map by dragging or zooming, you can view news from diferent cities, neighborhood, countries and continents.

##To run this project you need to.
Install bower globally
```console
npm install bower -g
```
Run
```
bower install
```

Install Elasticsearch
```console
brew install elasticsearch
```

Run the following comand to start elastic search(port 9200)
```console
elasticsearch
```

### Setup Datas to test the project
Run the following command to populate the database
```ruby
rake db:seed
```
INFO: Certify that Elasticsearch is running before running the seed file

Reindex Database to ensure that all data are sync with Elasticsearch
```console
rake searchkick:reindex:all
```

You can select your on map style
http://leaflet-extras.github.io/leaflet-providers/preview/index.html