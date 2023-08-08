class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors.append(vendor)
  end

  def clear_vendors
    @vendors.clear()
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.select { |vendor| vendor.check_stock(item) > 0 }
  end

  def sorted_item_list
    items = @vendors.flat_map { |vendor| vendor.inventory.keys}.uniq
    items.map { |item| item.name }.sort
  end

  def total_inventory
    total_inventory = Hash.new
    @vendors.flat_map { |vendor| vendor.inventory.keys}.uniq.each do |item|
      item_hash = Hash.new
      item_quantity = vendors_that_sell(item).sum { |vendor| vendor.check_stock(item)}
      item_vendors = vendors_that_sell(item)
      total_inventory[item] = {quantity: item_quantity, vendors: item_vendors}
    end
    total_inventory
  end

  def overstocked_items
    overstock = []
    item_objects = total_inventory.keys
    inventory = total_inventory
    inventory.each do |item, item_hash|
      if item_hash[:quantity] > 50 && item_hash[:vendors].count > 1
        overstock << item
      end
    end
    overstock
  end

end