require_relative "config/environment"
binding.pry
#initialize default player information
default_move1 = Move.find_by(name: "Binding-Dot-Pry Punch")
default_move2 = Move.find_by(name: "Laptop Smash")
    game_instance = Interface.new(default_move1, default_move2)
    #run the game
until game_instance.exit == true
    game_instance.run_game
end

