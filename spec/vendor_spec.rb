require './lib/item'
require './lib/vendor'

describe Vendor do
  let(:item1) {item1 = Item.new({name: 'Peach', price: "$0.75"})}
  let(:item1) {item2 = Item.new({name: 'Tomato', price: '$0.50'})}
  let(:vendor) {vendor = Vendor.new("Rocky Mountain Fresh")}
  describe "#initialize" do
    it "has readable name" do
      expect(vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "initializes with empty inventory hash" do
      expect(vendor.inventory).to eq({})
    end
  end

  describe "#check_stock" do
    it "returns 0 by default if item out of stock" do
      expect(vendor.check_stock(item1)).to eq(0)
    end
  end
end