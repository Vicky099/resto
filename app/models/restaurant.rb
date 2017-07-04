require "data_fetch/main.rb"
class Restaurant < ApplicationRecord

  def self.all_restaurants
    data =  JSON.parse(DataFetch::Main.get_restaurants.to_json)['businesses']
    result = data.sort_by!{|key| key['review_count']}
    return self.custom_response(result)
  end

  private
  def self.custom_response(results)
    data = []
    results.each do |record|
      data << {restaurant_name: record['name'],
                  address: {
                    latitude: record['latitude'],
                    longitude: record['longitude'],
                    city: record['city'],
                    state: record['state'],
                    zipcode: record['zip']
                  },
                  rating: record['avg_rating'],
                  count: record['review_count']}
    end
    return data
  end
end
