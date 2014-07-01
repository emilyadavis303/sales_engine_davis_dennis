require './test/test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  def setup
    @merchant = Merchant.new(id: '4', name: 'Cummings-Thiel')
  end

  def test_a_merchant_has_attributes
    assert_equal '4', @merchant.id
    assert_equal 'Cummings-Thiel', @merchant.name
  end
end
