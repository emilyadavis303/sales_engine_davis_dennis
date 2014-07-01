require './test/test_helper'
require './test/test_helper'
require 'csv'
require_relative '../lib/customer'


class CustomerTest < Minitest::Test
  def setup
    @customer = Customer.new(id: '4', first_name: 'Leanne', last_name: 'Braun')
  end

  def test_a_invoice_item_has_attributes
    assert_equal '4', @customer.id
    assert_equal 'Leanne', @customer.first_name
    assert_equal 'Braun', @customer.last_name
  end
end
