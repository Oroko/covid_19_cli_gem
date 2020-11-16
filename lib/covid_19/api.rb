class Covid19::API
  def get_continent_data
    url = 'https://disease.sh/v3/covid-19/continents?yesterday=true'
    response = HTTParty.get(url)
    response.each do |item|
     continent = Covid19::Continent.new(item)
      # cont.continent = continent
      # cont.cases = cases
      #binding.pry
    end
  end
end