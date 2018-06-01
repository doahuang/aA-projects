json.extract! @pokemon, :id, :name, :poke_type, :moves, :attack, :defense, :image_url
json.item_ids @pokemon.items.pluck(:id)
json.items do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :price, :happiness, :image_url, :pokemon_id
    end
  end
end
  