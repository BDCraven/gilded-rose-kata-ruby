require 'item'

describe Item do

  context 'on creation' do
    describe '.new' do
      it 'takes three arguments' do
        expect(Item).to respond_to(:new).with(3).arguments
      end
    end
  end

  before(:each) do
    @item_name = "foo"
    @sell_time = 10
    @quality_value = 10
    @new_item = Item.new(@item_name, @sell_time, @quality_value)
  end

  it "has a name value" do
    expect(@new_item.name).to eq @item_name
  end

  it "has a SellIn value" do
    expect(@new_item.sell_in).to eq @sell_time
  end

  it "has a quality value" do
    expect(@new_item.quality).to eq @quality_value
  end

  describe '#to_s' do
    it 'converts the item values to a string' do
      expect(@new_item.to_s).to eq('foo, 10, 10')
    end
  end

end
