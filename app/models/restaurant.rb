require "data_fetch/main.rb"
class Restaurant < ApplicationRecord

  def self.all_restaurants
    data =  JSON.parse(DataFetch::Main.get_restaurants.to_json)['businesses']
    return data.sort_by!{|key| key['review_count']}
  end

end
