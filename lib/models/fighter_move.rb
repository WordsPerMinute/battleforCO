class FighterMove < ActiveRecord::Base
    belongs_to :fighter
    belongs_to :move
end