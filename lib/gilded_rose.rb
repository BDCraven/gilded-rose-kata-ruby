class GildedRose

  def initialize(items)
    @items = items
  end

  def backstage_pass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def backstage_pass_update_quality(item)
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 0 if item.sell_in <= 0
  end

  def brie?(item)
    item.name == "Aged Brie"
  end

  def brie_update_quality(item)
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in <=0
  end

  def special_item?(item)
    brie?(item) || backstage_pass?(item)
  end

  def legendary_item?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def regular_item?(item)
   return true unless special_item?(item) == true || legendary_item?(item) == true
  end

  def regular_update_quality(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end

  def update_quality()
    @items.each do |item|
      regular_update_quality(item) if regular_item?(item)
      brie_update_quality(item) if brie?(item)
      backstage_pass_update_quality(item) if backstage_pass?(item)
    end
  end

end
