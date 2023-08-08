require './lib/item'

describe Item do
  let(:item1) {item1 = Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {item2 = Item.new({name: 'Tomato', price: '$0.50'})}
  describe "#initialize" do
    it "has readable name and price attributes" do
      expect(item1.name).to eq("Peach")
      expect(item2.price).to eq(0.5)
    end
  end
end 