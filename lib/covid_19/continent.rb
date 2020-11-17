# frozen_string_literal: true

class Covid19::Continent
  @@all = []

  attr_accessor :continent, :cases, :countries, :deaths, :population, :todaycases,
                :recovered, :tests
  def initialize(attr_hash)
    attr_hash.each do |key, value|
      send("#{key}=", value) if respond_to?("#{key}=")
    end
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
    # binding.pry
  end

  def self.continents
    all.each.with_index(1) do |item, index|
      puts "#{index}. #{item.continent}"
      
      #binding.pry
    end
  end

  def self.find_by_name(continent)
    
    all.select { |cont| cont.continent.downcase == continent }
  end
end
