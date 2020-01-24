class Interface
    attr_accessor :player, :base_move1, :base_move2, :bosses_defeated, :current_roll, :current_boss, :exit, :lose

    def initialize (base_move1, base_move2, current_roll = 0, bosses_defeated = 0, lose = false, exit = false, current_boss = nil, player = nil)
        @base_move1 = base_move1
        @base_move2 = base_move2
        @current_roll = current_roll
        @bosses_defeated = bosses_defeated
        @lose = lose
        @exit = exit
        @current_boss = current_boss
        @player = player
    end

    def player_input
        gets.chomp 
    end

    def player_create_character
        puts "\nWhat would you like to name your character?"
        playerName = player_input
        playerCharacter = Fighter.create(name: playerName, hp: 60, attack: 8, defense: 7)
        self.player = playerCharacter
        playerCharacter_join1 = FighterMove.create(fighter: playerCharacter, move: base_move1)
        playerCharacter_join2 = FighterMove.create(fighter: playerCharacter, move: base_move2)
        puts "\n"
    end

    def new_character_creation
        options = ["Yes", "No..."]
        prompt = TTY::Prompt.new
        user_action = prompt.select("\nAre you ready for an adventure?", options)
        if user_action == "Yes"
            player_create_character
        elsif user_action == "No..."
            puts "\nWhen you're ready to live a little, adventure awaits...\nGoodbye for now!\n"
            self.exit = true
        else
            puts "something broke"
        end
    end

    ############################
    #
    #
    # STORY MODE HERE
    #
    #
    ############################

    def run_story
        #binding.pry
        #keep fighting bosses and advancing story until you defeat the final boss OR die
        while self.bosses_defeated <= 4 && self.lose == false
            if self.bosses_defeated == 0
                story_text
                enter_battle
            elsif self.bosses_defeated == 1
                story_text
                enter_battle
            elsif self.bosses_defeated == 2
                story_text
                enter_battle
            elsif self.bosses_defeated == 3
                story_text
                enter_battle
            else
                story_text
            end
        end
    end

    def story_text
        if self.bosses_defeated == 0
            puts %q{
                You wake up in Pueblo, Colorado...
                The year is 2041. 
                For 5 years now your Flatiron School classmates have been missing.
                You wonder to yourself, "I hope they have been well... That none of them got corrupted by the virus."
                Your only mode of transportation is your feet.}
            print "\n"
            user_input = ""
            while user_input != "Head north toward Colorado Springs"
                options = ["Head north toward Colorado Springs", "Head south toward Sante Fe"]
                prompt = TTY::Prompt.new
                user_input = prompt.select("Which way will you walk, #{self.player.name}?", options)
                if user_input == options[0]
                    puts "
                    As the cityscape of Colorado Springs begins to appear through the fog, you spot your old classmate, Alice in Wonderland.
                    Something's not right though... She seems possessed...
                    ALICE: There's no going home now #{self.player.name}, off with your cabeza!"
                    gets
                    # print "\n"
                else
                    print "You begin to walk south, but you see a gang of wild Galvanize grads in the distance... Probably best to turn around..."
                    gets
                end
            end
        elsif self.bosses_defeated == 1
            puts "\n
            You never expected to say goodbye to #{self.current_boss.name} quite that way...
            You stopped in Castle Rock overnight to scour for supplies.
            You were lucky to find a can of cat food, that'll do. All canned food was resistent to the virus.
            As you lay down to rest for the night, a breeze turns into a howling wind, and you hear a voice.
            MYSTERY VOICE: #{player.name}...#{player.name}... I can't let you go any further..."
            gets
        elsif self.bosses_defeated == 2
            puts "\n
            Looks like #{self.current_boss.name} is gone with the wind...
            You make it to Denver, and walk along what used to be Cherry Creek Trail for signs of others.
            There used to be waterway, where there is now a stream of toxic waste.
            You spot a seabird gliding above the trail... Hm, long way from home for our flying friend, isn't it?
            Suddenly, a flock of seabirds descend upon you! 
            ALBATROSS AJ: My birds and I soar above you, #{player.name}, while you bottomfeed...
            ALBATROSS AJ: Do you still think the code you write has the power to help anyone?
            ALBATROSS AJ: Guess you'll have the learn the hard way, and die prying..."
            gets
        elsif self.bosses_defeated == 3
            puts "\n
            You finally make it to the old 'hub' where you it all started so many years ago.
            As you arrive to the top floor, #{player.name}, a feeling overtakes you ...
            Is this the end? Will you finally be able to get to the bottom of what went wrong, and perhaps find a cure to save the others?
            You've Laptop Smash'd enough people. You want to right wrongs with your code, not with your weapons.

            As you enter the lab, looking for cures, a figure emerges from the shadows... 
            KILLER KYLE: Oh, #{player.name}... I wish you didn't have to see me like this...
            KILLER KYLE: My own experiments... They spread so fast, and out of my control...
            KILLER KYLE: I'd quit if I could, but I've become infected myself...
            KILLER KYLE: If you want to save your friends, #{player.name}, you'll have to match my knife fighting fury!
            KILLER KYLE: Onguard!"
            gets
        else
            puts "\n
            You did it, #{player.name}!
            After mourning your mentor, who was corrupted by his own awesome inventions, you found the cure in his notebook!
            You will travel far and wide, #{player.name}.
            You will spread the cure outside of the land of Colorado, to all citizens of the world.
            If you choose to play in the future with the same name, your character will now have a new Flatiron Fencing attack!
            "
            gets
            exit!
        end
    end

    ############################
    #
    #
    # BATTLE STUFF STARTS HERE
    #
    #
    ############################

    def choose_attack
        #binding.pry
        options = [self.player.moves[0].name, self.player.moves[1].name]
        # options = [Fighter.all.last.moves[0].name, Fighter.all.last.moves[1].name]
        prompt = TTY::Prompt.new
        user_action = prompt.select("Which attack will you use?", options)
            if user_action == self.player.moves[0].name
                return self.player.moves[0].base_damage
            elsif user_action == self.player.moves[1].name
                return self.player.moves[1].base_damage
            else
                "something broke"
            end
    end

    def enter_battle
        #binding.pry
        bosses_in_order = ["Alice in Wonderland", "Airtight Aaron", "Albatross AJ", "Killer Kyle"]
        #reset health after each battle
        player.hp = 60
        self.current_boss = Fighter.find_by(name: bosses_in_order[self.bosses_defeated])
        puts "************"
        puts "#{self.current_boss.name} rushes in to attack...\n"
        puts "#{self.current_boss.name} has #{self.current_boss.hp} hit points, and #{self.current_boss.defense} defense,"
        puts "so you MUST get higher than a #{self.current_boss.defense} to hit!".red
        puts "************\n"
        continue = self.turn_taking
            if continue == true
                win_message
                self.bosses_defeated += 1
            else
                lose_message
            end
        #binding.pry

    end

    def win_message
        puts "
        ***********

        d–(^ ‿ ^ )z
        
        #{self.current_boss.name} has been DEFEATED!
        YOU WON!

        ***********
        "
        print "Press any key to continue..."
        gets
        #self.exit = true
    end

    def lose_message
        puts "
        **************

        ( ✖ _ ✖ )
        
        #{self.player.name} has been DEFEATED!
        YOU LOSE!

        **************
        "
        puts "Colorado's survivors attend your funeral with heavy hearts for their fallen hero. You defeated #{self.bosses_defeated} total bosses. You'll have to test fate and begin anew."
        print "Press any key to continue..."
        gets
        self.lose = true
        return
    end

    def turn_taking
        #binding.pry
        turn_counter = 0
        you_win = false
        you_lose = false
        while (you_win == false && you_lose == false)
            if turn_counter%2 == 0
                attack_damage = self.choose_attack
                dice_total = self.player_dice_roll
                self.damage_decider(dice_total, attack_damage)
                if self.check_win_or_lose == "w"
                    you_win = true
                elsif self.check_win_or_lose == "l"
                    you_lose = true
                else
                end
                print "Press enter for #{self.current_boss.name}'s turn..."
                gets
            elsif turn_counter%2 > 0
                enemy_move_choice = enemy_move_select
                attack_damage = enemy_move_choice.base_damage
                dice_total = enemy_dice_roll(enemy_move_choice)
                self.enemy_damage_decider(dice_total, attack_damage)
                if self.check_win_or_lose == "w"
                    you_win = true
                elsif self.check_win_or_lose == "l"
                    you_lose = true
                else
                end
            else
                puts "something broke"
            end
            turn_counter += 1
        end
        if you_win == true
            true
        else
            false
        end
    end

    def check_win_or_lose
        if self.current_boss.hp < 1
            "w"
        elsif self.player.hp < 1
            "l"
        else
        end
    end

    def player_dice_roll
        self.player_dice_rolling_prompt
        diceArray = dice_rolling
        puts "You rolled a #{diceArray[0]}.".light_blue
        options = ["Yes"]
        prompt = TTY::Prompt.new
        user_action = prompt.select("Ready to roll again?", options)
        puts "You rolled a #{diceArray[1]}.\n".light_blue
        puts "Your dice total is #{diceArray.sum}...".light_blue
        self.current_roll = diceArray.sum
    end

    def enemy_move_select
        self.current_boss.moves[(rand(0..1))]
    end

    def enemy_dice_roll(enemy_move)
        puts "#{self.current_boss.name} chose to use #{enemy_move.name}.".red
        diceArray = dice_rolling
        puts "#{self.current_boss.name} rolled a #{diceArray[0].to_s} and a #{diceArray[1].to_s}.".red
        self.current_roll = diceArray.sum
    end

    def player_dice_rolling_prompt
        user_action = ""
        while user_action != "Roll!"
        options = ["Roll!", "No."]
        prompt = TTY::Prompt.new
        user_action = prompt.select("Roll first die?", options)
            if user_action == "Roll!"
                #exits this function to enter the player_dice_roll
            elsif user_action == "No."
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

    def damage_decider(dice_total, damage)
        if dice_total == 2
            puts "Rolling snake eyes always hurts yourself. Unlucky. Ouch!".light_blue
            self.player.hp -= damage
            puts "#{self.player.name}'s health drops to #{self.player.hp}.\n".light_blue
        elsif dice_total == 12
            double_damage = damage * 2
            puts "You rolled two sixes! Two sixes does DOUBLE DAMAGE! You hit for #{double_damage} instead of #{damage}. Critical Hit!".light_blue
            self.current_boss.hp -= double_damage
            puts "#{self.current_boss.name}'s health dropped to #{self.current_boss.hp}!\n".light_blue
        elsif dice_total >= self.current_boss.defense
            puts "You hit #{self.current_boss.name} for #{damage} damage!".light_blue
            self.current_boss.hp -= damage
            puts "#{self.current_boss.name}'s health dropped to #{self.current_boss.hp}!\n".light_blue
        elsif dice_total <= self.current_boss.defense
            puts "Your roll (#{self.current_roll}) was less than #{self.current_boss.name}'s defense (#{self.current_boss.defense}).\nYour attack missed :(\n".light_blue
        else 
            puts "something broke"
        end
    end

    def enemy_damage_decider(dice_total, damage)
        if dice_total == 2
            puts "#{self.current_boss.name} rolled snake eyes and hurt themself!".red
            self.current_boss.hp -= damage
            puts "#{self.current_boss.name}'s health drops to #{self.current_boss.hp}.\n".red
        elsif dice_total == 12
            double_damage = damage * 2
            puts "#{self.current_boss.name} rolled two sixes! Two sixes does DOUBLE DAMAGE! #{self.current_boss.name} hit for #{double_damage} instead of #{damage}. Critical Hit!".red
            self.player.hp -= double_damage
            puts "#{self.player.name}'s health dropped to #{self.player.hp}!\n".red
        elsif dice_total >= self.player.defense
            puts "#{self.current_boss.name} hit #{self.player.name} for #{damage} damage!".red
            self.player.hp -= damage
            puts "#{self.player.name}'s health dropped to #{self.player.hp}.\n".red
        elsif dice_total <= self.player.defense
            puts "#{self.current_boss.name}'s roll (#{self.current_roll}) was less than #{self.player.name}'s defense (#{self.player.defense}).\n#{self.current_boss.name}'s attack missed!\n".red
        else 
            puts "something broke"
        end
    end




    ############################
    #
    #
    # RUN THE GAME
    #
    #
    ############################

    def run_game
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
        self.exit = false
        self.lose = false
        new_character_creation
        if self.exit != true
            self.run_story
        end
    end


end

