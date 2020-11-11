class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def item_info(item)
    item_hash = {}
    quantity = @vendors.sum do |vendor|
      vendor.inventory[item]
    end
    item_hash[:quantity] = quantity
    item_hash[:vendors] = vendors_that_sell(item)
    item_hash
  end

  def items_on_the_market
    all_items = []
    @vendors.each do |vendor|
      all_items << vendor.inventory.keys
    end
    all_items.flatten.uniq
  end

  def total_inventory
    breakdown = {}
    items_on_the_market.each do |item|
      breakdown[item] = item_info(item)
    end
    breakdown
  end

  def overstocked_items
    total_inventory.select do |item, item_info|
      vendors_that_sell(item).count > 1
      item_info[:quantity] > 50
    end.keys
  end
end