require_relative "../config/environment"

#prompt user for input / main menu
def welcome_to_game
    puts "Welcome to the battle for Colorado!!!"
end

def player_input
    gets.chomp 
end

def new_character_creation
    puts "What would you like to name your character?!?"
    playerName = player_input
    playerCharacter = Fighter.create(name: playerName, hp: 18, attack: 5, defense: 9) 
end

def restart_message
    puts 'OH YOU WOULD LIKE TO TRY YOUR LUCK AGAIN HUH??'
end

# welcome_to_game
# new_character_creation
binding.pry
# restart_message

