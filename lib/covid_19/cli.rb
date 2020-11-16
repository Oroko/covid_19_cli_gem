# frozen_string_literal: true

# I am using namespacing so that incase someone wants to use my gem in their own gem and they have the
# smae file named as mine it won't cause a conflict.

class Covid19::CLI
  def start
    puts 'Welcome to the Covid-19 Command Line Application'
    puts 'What stats are you interested in?'
    puts 'Make a selection by picking entering a number from 1-3'
    puts "or Exit the Application\n\n"
    Covid19::API.new.get_continent_data
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
    when 2
      country_menu
    when 3
      puts 'Goodbye and stay safe!'
    end
  end

  def continents_list
    puts 'Here is a list of Continents'
    Covid19::Continent.all.each.with_index(1) do |item, index|
      puts "#{index}. #{item.continent}"
    end

    puts 'Choose a continent to get more information'

  end
  # def continent_menu
  #   continents_list
  # end
  def chosen_continent
   input = gets.strip.to_i
   puts "You have chosen #{input}"
  end

  
 end
