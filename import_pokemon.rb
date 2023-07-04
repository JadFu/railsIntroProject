load 'ar.rb'

# Fetch data from the API
url = 'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0'
uri = URI(url)
response = Net::HTTP.get(uri)
pokemon_data = JSON.parse(response)

# Process each pokemon
pokemon_data['results'].each do |pokemon|
  # Fetch additional data for each pokemon
  pokemon_uri = URI(pokemon['url'])
  pokemon_response = Net::HTTP.get(pokemon_uri)
  pokemon_details = JSON.parse(pokemon_response)

  # Extract relevant data
  name = pokemon['name']
  type1_name = pokemon_details['types'][0]['type']['name']
  type2_name = pokemon_details['types'][1]['type']['name'] if pokemon_details['types'].length > 1
  hp = pokemon_details['stats'][0]['base_stat']
  attack = pokemon_details['stats'][1]['base_stat']
  defense = pokemon_details['stats'][2]['base_stat']
  special_attack = pokemon_details['stats'][3]['base_stat']
  special_defense = pokemon_details['stats'][4]['base_stat']
  speed = pokemon_details['stats'][5]['base_stat']
  image = pokemon_details['sprites']['other']['official-artwork']['front_default']

  # Find type objects
    type1 = Type.where(name: type1_name).limit(1).pluck(:id).first
    type2 = Type.where(name: type2_name).limit(1).pluck(:id).first if type2_name
    print(type1)

  # Create the pokemon record
Pokemon.create(
    name: name,
    type1: type1, # Assign the type1 ID directly
    type2: type2, # Assign the type2 ID directly
    HP: hp,
    ATK: attack,
    DEF: defense,
    SA: special_attack,
    SD: special_defense,
    SP: speed,
    image: image
  )
end