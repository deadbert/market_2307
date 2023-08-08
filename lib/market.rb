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
end