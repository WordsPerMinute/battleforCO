#prompt user for input / main menu

require_relative "config/environment"


def welcome_message
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


welcome_message

#Fighter.new_player
new_character_creation

restart_message

