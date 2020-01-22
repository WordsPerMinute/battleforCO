class Fighter < ActiveRecord::Base
    has_many :fighter_moves
    has_many :moves, through: :fighter_moves

    # def self.new_player
    #     Fighter.create(name: gets.chomp, hp: 0, attack: 5, defense: 9)
    # end
end