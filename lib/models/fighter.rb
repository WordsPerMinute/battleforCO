class Fighter < ActiveRecord::Base
    has_many :fighter_moves
    has_many :moves, through: :fighter_moves
end