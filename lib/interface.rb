require_relative "../config/environment"

#prompt user for input / main menu
def welcome_to_game
    puts "
    ~~Welcome to the Battle for Colorado!~~

    MMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMMMMM
    MMMMMMMMMMMMMMMMMWXd:dNMMMMMMMMMMMMMMMMM
    MMMMMMMMMMMMMMMMMXc..'c0WMMMMMMMMMMMMMMM
    MMMMMMMMMMWWMMMMXc.cKO:,kWWWMMMWMMMMMMMM
    MMMMMMMMWWWWWMMXc .kMMNx:oXMMMMWMMMMMMMM
    MMMMMMMMWNOxOXXl. ,0WWWWKoo0WMWMMMMMMMMM
    MMMMMMMMKdd0Oo;.  .;ldXWWW0oxXMMWWWMMMMM
    MMMMWWNk,:ONx'       .dXxo0KdoKNxcOWMMWW
    MMWWW0:. .'o; ..    ...,,,coOxc;.:xOWMMM
    MWWXx:. .  ..ld' ......,dOXkd0l  ,xxONWM
    MNOxO0:;xdc;dXx;'cdddoo0WWWWNXx,:;,oOOXW
    X00NMKxKMWNXWX0XXNX0KXWMMMMWWMXKNN00NXKN
    NWMMMNNMMMMMMWWMMMWWWMMMMMMMMMWWMMMWMMWN"
end

def player_input
    gets.chomp 
end

def player_create_character
    puts "What would you like to name your character?"
    playerName = player_input
    playerCharacter = Fighter.create(name: playerName, hp: 18, attack: 5, defense: 9)
    puts "\n"
end

def new_character_creation
    options = ["Yes", "No", "I'm not sure yet"]
    prompt = TTY::Prompt.new
    user_action = prompt.select("Are you ready for an adventure?", options)
    if user_action == "Yes"
        player_create_character
    elsif user_action == "No"
        puts "\nWell too bad! People need your help!\n\n"
        player_create_character
    else
        puts "something broke"
    end
end

#setting this to 0 when the program starts
#reminder to self: also reset it to 0 if user losses and wants to start a new game
bossesDefeated = 0
def run_story
    if bossesDefeated = 0
        puts %q{
        You wake up in Pueblo, Colorado...
        The year is 2041. 
        For 5 years now your Flatiron School classmates have been missing.
        You wonder to yourself, "I hope they have been well... That none of them got corrupted by the virus."
        Your only mode of transportation is your feet.}
    elsif bossesDefeated = 1
    elsif bossesDefeated = 2
    elsif bossesDefeated = 3
    else
    end
end

def restart_prompt
    options = ["Yes", "No"]
    prompt = TTY::Prompt.new
    user_action = prompt.select("Oh, so you would like to try your luck again, HUH?!", options)
end

# main_menu_options = MainMenuOption.all.map {|option| option.option_name}
# user_action = prompt.select("What do you want to do?", main_menu_options)


# welcome_to_game
# new_character_creation
# binding.pry
# restart_message

