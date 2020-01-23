require_relative "../config/environment"

FighterMove.destroy_all
Fighter.destroy_all
Move.destroy_all


enemyKillerKyle = Fighter.create(name: "Killer Kyle", hp: 50, attack: 11, defense: 7)

movePunch = Move.create(name: "punch", base_damage: 4, minimum_to_hit: 5, when_to_critical: 12, when_to_damage_self: 2)

killerKyle = FighterMove.create(fighter: enemyKillerKyle, move: movePunch)


# facebook = SocialMedia.create(name: "Facebook")
# instagram = SocialMedia.create(name: "Instagram")
# twitter = SocialMedia.create(name: "Twitter")

# #no associations
# Post.create(user_id: user1.id, social_media_id: facebook.id)
# #if associations
# Post.create(user1, social_media: facebook)
# user1.social_medias.create(name: "Snapchat")

# response = RestClient.get('https://rickandmortyapi.com/api/character')
# parsed_response = JSON.parse(response)
# parsed_response["results"].map do |character|
#     User.create(name: character["name"], age: rand(20..30))
# end