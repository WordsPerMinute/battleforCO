class CreateFightersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :hp
      t.integer :attack
      t.integer :defense
    end
  end
end
