require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  let(:item1) {item1 = Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {item2 = Item.new({name: 'Tomato', price: '$0.50'})}
  let(:vendor) {vendor = Vendor.new("Rocky Mountain Fresh")}
  let(:market) {market = Market.new("South Pearl Street Farmers Market")}
  describe "#initialize" do
    it "has readable name attribute" do
      expect(market.name).to eq("South Pearl Street Farmers Market")
    end

    it "initializes with empty array of vendors" do
      expect(market.vendros).to eq([])
    end
  end
end