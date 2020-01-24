FighterMove.destroy_all
Fighter.destroy_all
Move.destroy_all

enemyAlice = Fighter.create(name: "Alice in Wonderland", hp: 40, attack: 11, defense: 4)
enemyAaron = Fighter.create(name: "Airtight Aaron", hp: 45, attack: 11, defense: 5)
enemyAJ = Fighter.create(name: "Albatross AJ", hp: 50, attack: 11, defense: 6)
enemyKillerKyle = Fighter.create(name: "Killer Kyle", hp: 55, attack: 11, defense: 7)

movePunch = Move.create(name: "Binding-Dot-Pry Punch", base_damage: 8, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)
laptopSmash = Move.create(name: "Laptop Smash", base_damage: 12, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)

rabbit_smack = Move.create(name: "White Rabbit Smack", base_damage: 4, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)
tea_pot = Move.create(name: "Tea Pot Projectile", base_damage: 10, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)

vacuum_seal = Move.create(name: "Vacuum Your Face", base_damage: 5, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)
tornado_squeeze = Move.create(name: "Excellent Exhale", base_damage: 12, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)

seaside_sucker = Move.create(name: "Seaside Suckerpunch", base_damage: 5, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)
bird_watch = Move.create(name: "Birdwatch Beatdown", base_damage: 13, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)

shank = Move.create(name: "Shank", base_damage: 7, minimum_to_hit: 4, when_to_critical: 12, when_to_damage_self: 2)
ribbon_slash = Move.create(name: "Ribbon Slash", base_damage: 14, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)


enemyAlice_join1 = FighterMove.create(fighter: enemyAlice, move: rabbit_smack)
enemyAlice_join2 = FighterMove.create(fighter: enemyAlice, move: tea_pot)
enemyAaron_join1 = FighterMove.create(fighter: enemyAaron, move: vacuum_seal)
enemyAaron_join2 = FighterMove.create(fighter: enemyAaron, move: tornado_squeeze)
enemyAJ_join1 = FighterMove.create(fighter: enemyAJ, move: seaside_sucker)
enemyAJ_join2 = FighterMove.create(fighter: enemyAJ, move: bird_watch)
enemyKillerKyle_join1 = FighterMove.create(fighter: enemyKillerKyle, move: ribbon_slash)
enemyKillerKyle_join2 = FighterMove.create(fighter: enemyKillerKyle, move: shank)