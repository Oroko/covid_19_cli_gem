
#I am using namespacing so that incase someone wants to use my gem in their own gem and they have the 
# smae file named as mine it won't cause a conflict.

module Covid19::CLI 
  def start
    puts 'I am in the cli'
  end
end