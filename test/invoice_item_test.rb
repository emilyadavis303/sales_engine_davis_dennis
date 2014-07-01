require './test/test_helper'
require './test/test_helper'
require 'csv'
require_relative '../lib/invoice_item'


class InvoiceTest < Minitest::Test
  def setup
    @invoice_item = InvoiceItem.new(id: '4', item_id: '535', quantity: '3')
  end

  def test_a_invoice_item_has_attributes
    assert_equal '4', @invoice_item.id
    assert_equal '535', @invoice_item.item_id
    assert_equal '3', @invoice_item.quantity
  end
end
