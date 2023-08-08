require './lib/item'
require './lib/vendor'

describe Vendor do
  let(:item1) {item1 = Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {item2 = Item.new({name: 'Tomato', price: '$0.50'})}
  let(:item3) {item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4){item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let(:vendor1) {vendor1 = Vendor.new("Rocky Mountain Fresh")}
  let(:vendor2) {vendor2 = Vendor.new("Ba-Nom-a-Nom")}
  let(:vendor3) {vendor3 = Vendor.new("Palisade Peach Shack")}
  describe "#initialize" do
    it "has readable name" do
      expect(vendor1.name).to eq("Rocky Mountain Fresh")
    end

    it "initializes with empty inventory hash" do
      expect(vendor1.inventory).to eq({})
    end
  end

  describe "#check_stock" do
    it "returns 0 by default if item out of stock" do
      expect(vendor1.check_stock(item1)).to eq(0)
    end
  end

  describe "#stock" do
    it "adds a specified number of an item to the vendor inventory" do
      vendor1.stock(item1, 30)

      expect(vendor1.inventory).to eq({item1 => 30})
      expect(vendor1.check_stock(item1)).to eq(30)

      vendor1.stock(item1, 25)
      expect(vendor1.check_stock(item1)).to eq(55)

      vendor1.stock(item2, 12)
      expect(vendor1.inventory).to eq({item1 => 55, item2 => 12})
    end
  end

  describe "#potential_revenue" do 
    it "returns the sum of all vendors items cost * their quantity" do
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345.00)
      expect(vendor3.potential_revenue).to eq(48.75)
    end
  end
end