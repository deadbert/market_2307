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

end