class Covid19::API
  def self.fetch_continent_data
    url = 'https://disease.sh/v3/covid-19/continents?yesterday=true'
    response_array = HTTParty.get(url)
    response_array.each do |continent|
     Covid19::Continent.new(continent)
     #continent = Covid19::Continent.new(item)
      # cont.continent = continent
      # cont.cases = cases
      # binding.pry
    end
  end
end