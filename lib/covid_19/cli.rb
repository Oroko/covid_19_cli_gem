# frozen_string_literal: true

# I am using namespacing so that incase someone wants to use my gem in their own gem and they have the
# smae file named as mine it won't cause a conflict.

class Covid19::CLI
  def start
    puts 'Welcome to the Covid-19 Command Line Application'
    puts 'What stats are you interested in?'
    puts 'Make a selection by  entering a number from 1-2'
    puts "or Exit the Application by entering 3 \n\n"
    Covid19::API.fetch_continent_data
    menu
  end

  def menu
    # loop through the api data and grab a list of continents
    # continents_list

    # puts '7. Exit'
    # puts ''
    # puts ''
    # puts 'What continent are you interested in?'
    # name = gets.strip.downcase

    puts '1. Continents'
    puts '2. Country'
    puts '3. Exit'

    choice = gets.strip.to_i

    case choice
    when 1
      continents_list
      menu
    when 2
      country_menu
      menu
    when 3
      goodbye
    else
      invalid_entry
    end
  end

  def continents_list
    puts 'Here is a list of Continents'
    Covid19::Continent.continents
    #binding.pry

    puts 'Choose a continent to get more information'
   
    input = gets.strip.downcase
    chosen_continent(input)
    #chosen_continent(input)
  end

  # def continent_menu
  #   continents_list
  # end
  def chosen_continent(continent)
    cont = Covid19::Continent.find_by_name(continent)
    cont.each do |c|
      puts "#{c.continent.upcase} Covid data"
      puts "Total Cases: #{c.cases}"
      puts "Total Deaths: #{c.deaths}"
    end
    
    #binding.pry
  end

  def country_menu
    puts 'You are in country menu'
  end

  def goodbye
    puts 'Goodbye and stay safe!'
    
  end

  def invalid_entry
    puts 'Invalid Entry'
    puts 'Choose  an option by entering 1 - 3'
    menu
  end
end
