# Add seed data in this file

puts 'Seeding Spells...'

#spells we want to add to our database

spells = ['acid-arrow', 'animal-messenger', 'calm-emotions', 'charm-person']


spells.each do |spell|

    #make a request to endpoints for individual spell
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

    #response will return as a JSON-formatted string
    #use JSON-parse to convert the string to Ruby hash
    spell_hash = JSON.parse(response)

    #create a spell on database using data from hash
    Spell.create(
        name: spell_hash['name'],
        level: spell_hash['level'],
        description: spell_hash['desc'][0]
    )

end

puts 'Done Seeding...'