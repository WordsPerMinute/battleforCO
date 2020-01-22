class Move < ActiveRecord::Base
    has_many :fighter_moves
    has_many :fighters, through: :fighter_moves
end