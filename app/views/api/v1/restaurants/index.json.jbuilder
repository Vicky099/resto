json.restaurants @restaurants do |restaurant|
  json.restaurenat_name restaurant['name']
  json.address do
    json.latitude restaurant['latitude']
    json.longitude restaurant['longitude']
    json.city restaurant['city']
    json.state restaurant['state']
    json.zipcode restaurant['zip']
  end
  json.rating restaurant['avg_rating']
  json.count restaurant['review_count']
end
