require 'faker'

# Generate a fake pokemon for each type
Type.all.each do |type1|
    Type.all.each do |type2|
        name = Faker::Name.unique.first_name
        hp = Faker::Number.between(from: 1, to: 99)
        attack = Faker::Number.between(from: 1, to: 99)
        defense = Faker::Number.between(from: 1, to: 99)
        special_attack = Faker::Number.between(from: 1, to: 99)
        special_defense = Faker::Number.between(from: 1, to: 99)
        speed = Faker::Number.between(from: 1, to: 99)
        image = 'https://www.sqwordle.io/static/media/mystery.3650ba250b7070440dc0.jpg'

        Pokemon.create(
            name: name,
            type1: type1.id,
            type2: type2.id,
            HP: hp,
            ATK: attack,
            DEF: defense,
            SA: special_attack,
            SD: special_defense,
            SP: speed,
            image: image
        )
    end
end