require_relative "../config/environment"

<<<<<<< HEAD
def player_dice_second_roll
    diceArray = dice_rolling
    puts "\nYou rolled a #{diceArray[0].to_s} on your first die!"
    options = ["Yes"]
    prompt = TTY::Prompt.new
    user_action = prompt.select("\nReady to roll again?", options)
    puts "\nYou rolled a #{diceArray[1].to_s} on your second die!\n"
    puts "\nYour total is dice rolling #{diceArray.sum.to_s}"
end

def player_dice_rolling_prompt
    user_action = ""
    while user_action != "Yes"
    options = ["Yes", "No"]
    prompt = TTY::Prompt.new
    user_action = prompt.select("Do you want to roll?", options)
        if user_action == "Yes"
            player_dice_second_roll
        elsif user_action == "No"
            puts "\nWell... you have to!\n"
        else
            "something broke"
        end
    end
end


def dice_rolling
   dice1 = (rand(1..6)),
   dice2 = (rand(1..6))
end

"You rolled a _____ on your first dice"
"Ready roll again?"
"Yes"
"No"
"You rolled a ____ on your second dice. Your total is ____."


# def damage_dealer(damage)
#     # elsif dice_rolling == 2 "hurts fighter"
#     #else dice_rolling == 12 "deal 1 extra damage"
#     if dice_rolling.sum >= fighter.defense || do
#         enemy.hp - fighter.damage
#     #elsif dice_rolling.sum <= fighter.defense
#     #else 

#     end
# end


dice_rolling
binding.pry
=======
def dice_roller
    puts %q{Type "r" to roll your dice}
end

>>>>>>> master
# methods regarding battling here, including rolling dice