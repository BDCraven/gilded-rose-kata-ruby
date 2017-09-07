require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'the SellIn value of items is lowered by one' do
      items = [Item.new("foo", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it 'the quality of items is lowered by one' do
      items = [Item.new("foo", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it 'the quality of items is lowered by two once sell by date has passed' do
      items = [Item.new("foo", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it 'quality is never negative' do
      items = [Item.new("foo", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it 'quality is never over 50' do
      items = [Item.new("foo", 10, 51)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    context 'Sulfuras, Hand of Ragnaros' do
      it 'does not lower the SellIn value of Sulfuras, Hand of Ragnaros' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
      end

      it 'does not lower the quality of Sulfuras, Hand of Raganaro' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 10
      end
    end

    context 'Aged Brie' do
      it 'the quality of Aged Brie is not lowered but increased by one' do
        items = [Item.new("Aged Brie", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
      end

      it 'quality of Aged Brie is increased by two after its sell by date' do
        items = [Item.new("Aged Brie", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
      end

      it 'the quality of Aged Brie does not exceed 50' do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end

    end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'quality increases by one as its SellIn value approaches' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
      end

      it 'quality increases by two when SellIn value is 10 or less' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
      end

      it 'quality increases by 3 when there are 5 days or less' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 13
      end

      it 'quality drops to zero after the concert' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end

      it 'the quality does not exceed 50' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context 'conjured items' do
      it 'the quality descrease by two' do
        pending('code needs to be refactored first')
        items = [Item.new("Conjured items", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 8
      end
    end

  end
end
