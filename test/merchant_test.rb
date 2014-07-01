gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'csv'
require_relative '../lib/merchant'
require_relative '../lib/merchant_repository'


class MerchantTest < Minitest::Test
  def setup
    @merchant = Merchant.new(id: '4', name: 'Cummings-Thiel')
  end

  def test_a_merchant_has_attributes
    assert_equal '4', @merchant.id
    assert_equal 'Cummings-Thiel', @merchant.name
  end
end
