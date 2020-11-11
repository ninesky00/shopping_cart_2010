class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new
  end
end