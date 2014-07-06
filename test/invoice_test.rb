require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  def setup
    @invoice = Invoice.new(data, self)
  end

  def data
    { :id=>          '2',
      :customer_id=> '1',
      :merchant_id=> '75',
      :status=>      'shipped',
      :created_at=>  '2012-03-12 05:54:09 UTC',
      :updated_at=>  '2012-03-12 05:54:09 UTC'
    }
  end

  def test_an_invoice_has_attributes
    @invoice.id
    @invoice.customer_id
    @invoice.merchant_id
    @invoice.status
    @invoice.created_at
    @invoice.updated_at
  end

  def test_an_invoice_knows_its_attributes
    assert_equal '2', @invoice.id
    assert_equal '1', @invoice.customer_id
    assert_equal '75', @invoice.merchant_id
    assert_equal 'shipped', @invoice.status
    assert_equal '2012-03-12 05:54:09 UTC', @invoice.created_at
    assert_equal '2012-03-12 05:54:09 UTC', @invoice.updated_at
  end
end
