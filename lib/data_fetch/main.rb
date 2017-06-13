module DataFetch
  module Main
    def self.get_restaurants
      begin
        result = File.read("#{Rails.root}/public/resto.json")
        return ActiveSupport::JSON.decode(result)
      rescue Exception => e
        return e.message
      end
    end
  end
end
