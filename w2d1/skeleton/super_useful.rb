# PHASE 2

def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "not numbers"
  ensure
    num
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue StandardError => e
    retry if maybe_fruit == "coffee"
  end
end  


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length == 0
      raise ArgumentError.new("I know your friend has a name")
    end
    @name = name
    if yrs_known < 5
      raise ArgumentError.new("You have not been friends for at least 5 years.")
    end
    @yrs_known = yrs_known
    if fav_pastime.length == 0
      raise ArgumentError.new("Tell me what you like to do together")
    end
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

