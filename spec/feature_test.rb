require './lib/gilded_rose.rb'
require './lib/item.rb'

items = [Item.new("Aged Brie", 10, 10)]
GildedRose.new(items).update_quality()
p items.to_s
