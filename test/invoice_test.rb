require './test/test_helper'
require './test/test_helper'
require 'csv'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repository'


class InvoiceTest < Minitest::Test
  def setup
    @invoice = Invoice.new(id: '4', merchant_id: '33')
  end

  def test_a_item_has_attributes
    assert_equal '4', @invoice.id
    assert_equal '33', @invoice.merchant_id
  end
end
