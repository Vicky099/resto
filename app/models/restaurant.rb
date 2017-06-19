require "data_fetch/main.rb"
class Restaurant < ApplicationRecord

  def self.all_restaurants
    data =  JSON.parse(DataFetch::Main.get_restaurants.to_json)['businesses']
    return data.sort_by!{|key| key['review_count']}
  end

  def as_json(options={})
    {:restaurant_name => "name",
      :methods => [:address],
      :rating => 'avg_rating',
      :count => 'review_count'}
  end

  def address
    {:latitude => 'latitude',
        :longitude => 'longitude',
        :city => 'city',
        :state => 'state',
        :zipcode => 'zip'}
  end
end
