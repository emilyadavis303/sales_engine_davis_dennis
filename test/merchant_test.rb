require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  def setup
    @merchant = Merchant.new(data, self)
  end

  def data
    { :id=>         '1',
      :name=>       'Schroeder-Jerde',
      :created_at=> '2012-03-27 14:53:59 UTC',
      :updated_at=> '2012-03-27 14:53:59 UTC'
    }
  end

  def test_it_has_attributes
    @merchant.id
    @merchant.name
    @merchant.created_at
    @merchant.updated_at
  end

  def test_a_merchant_knows_its_attributes
    assert_equal '1', @merchant.id
    assert_equal 'Schroeder-Jerde', @merchant.name
    assert_equal '2012-03-27 14:53:59 UTC', @merchant.created_at
    assert_equal '2012-03-27 14:53:59 UTC', @merchant.updated_at
  end
end
