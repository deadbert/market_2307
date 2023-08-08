require './lib/item'
require './lib/vendor'

describe Vendor do
  let(:item1) {item1 = Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {item2 = Item.new({name: 'Tomato', price: '$0.50'})}
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

  describe "#stock" do
    it "adds a specified number of an item to the vendor inventory" do
      vendor.stock(item1, 30)

      expect(vendor.inventory).to eq({item1 => 30})
      expect(vendor.check_stock(item1)).to eq(30)

      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)

      vendor.stock(item2, 12)
      expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
    end
  end
end