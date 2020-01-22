class CreateMovesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :base_damage
      t.integer :minimum_to_hit
      t.integer :when_to_critical
      t.integer :when_to_damage_self
    end
  end
end

# name = "punch"
# base_damage = 3
# minimum_to_hit = 5
# when_to_critical = 12
# when_to_damage_self = 2
