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

  # def total_inventory
  #   breakdown = {}
  #   @vendors.each do |vendor|
  #     require 'pry';binding.pry
  #     vendor.inventory.each do |item|
  #       breakdown ||= item 
  #       breakdown[item] = 
  #     end
  #     end
  #   end
  # end
end