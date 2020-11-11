require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < MiniTest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_attributes_are_instantiated
    assert_instance_of Vendor, @vendor
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end

end