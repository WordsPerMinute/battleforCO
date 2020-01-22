class CreateFighterMovesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :fighter_moves do |t|
      t.references :fighter, foreign_key: true
      t.references :move, foreign_key: true
    end
  end
end

#uniq constraint
