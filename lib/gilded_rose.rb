class GildedRose

  def initialize(items)
    @items = items
  end

def backstage_pass?(item)
  item.name == "Backstage passes to a TAFKAL80ETC concert"
end

def backstage_pass_quality_rules(item)
  if item.sell_in < 11
    increase_quality(item)
  end
  if item.sell_in < 6
    increase_quality(item)
  end
end

def special_item?(item)
  item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
end

def legendary_item?(item)
  item.name == "Sulfuras, Hand of Ragnaros"
end

def regular_item?(item)
 return true unless special_item?(item) == true || legendary_item?(item) == true
end

def increase_quality(item)
  if item.quality < 50
    item.quality += 1
  end
end

def reduce_quality(item)
  if item.quality > 0
    item.quality -= 1
  end
end

  def update_quality()
    @items.each do |item|
      if regular_item?(item)
        reduce_quality(item)
      end

      if special_item?(item)
        increase_quality(item)
      end

      if backstage_pass?(item)
        backstage_pass_quality_rules(item)
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end

      if regular_item?(item) && item.sell_in < 0
        reduce_quality(item)
      end

      if item.name == "Aged Brie" && item.sell_in < 0
        increase_quality(item)
      end

      if backstage_pass?(item) && item.sell_in < 0
        item.quality = item.quality - item.quality
      end

    end
  end
end
