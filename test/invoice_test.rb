require './test/test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  def setup
    @invoice = Invoice.new(id: '4', merchant_id: '33')
  end

  def test_a_item_has_attributes
    assert_equal '4', @invoice.id
    assert_equal '33', @invoice.merchant_id
  end
end
