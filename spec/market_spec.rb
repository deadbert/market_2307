require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  before :each do
    
  end
  let(:item1) {item1 = Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {item2 = Item.new({name: 'Tomato', price: '$0.50'})}
  let(:item3) {item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4){item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let(:vendor1) {vendor1 = Vendor.new("Rocky Mountain Fresh")}
  let(:vendor2) {vendor2 = Vendor.new("Ba-Nom-a-Nom")}
  let(:vendor3) {vendor3 = Vendor.new("Palisade Peach Shack")}
  let(:market) {market = Market.new("South Pearl Street Farmers Market")}
  before :each do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
  end
  describe "#initialize" do
    it "has readable name attribute" do
      expect(market.name).to eq("South Pearl Street Farmers Market")
    end

    it "initializes with empty array of vendors" do
      market.clear_vendors
      expect(market.vendors).to eq([])
    end
  end

  describe "#add_vendor" do
    it "adds a vendor object to the vendor list" do
      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end
  end

  describe "#vendor_names" do
    it "returns an array containing the name of each vendor object" do
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe "#vendors_that_sell" do
    it "returns array of vendors that sell the requested item" do
      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end

  describe "#sorted_item_list" do
    it "returns array of names of all items vendors have in stock, sorted alphabetically with no duplicates" do
      expect(market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe "#total_inventory" do
    it "returns hash with items as keys with hash value that stores {quantity: item_total, vendors: [selling vendors]}" do
      expected = {
        item1 => {
          quantity: 100,
          vendors: [vendor1, vendor3],
        },
        item2 => {
          quantity: 7,
          vendors: [vendor1],
        },
        item3 => {
          quantity: 25,
          vendors: [vendor2],
        },
        item4 => {
          quantity: 50,
          vendors: [vendor2],
        }
      }
      expect(market.total_inventory).to eq(expected)
    end
  end

  describe "#overstocked_items" do
    it "returns arroy of Item objects that are sold by more than 1 vendor AND total stock is greater than 50" do
      expect(market.overstocked_items).to eq([item1])
    end
  end
end