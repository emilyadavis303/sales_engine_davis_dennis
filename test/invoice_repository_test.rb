require './test/test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  def setup
    engine = SalesEngine.new
    engine.startup('test/fixtures/')
    @repo ||= InvoiceRepository.new(engine, 'test/fixtures/')
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_invoices
    assert @repo.count >= 10
  end

  def test_can_find_by_status
    result = @repo.find_by_status('shipped')
    assert_equal '26', result.merchant_id
  end

  def test_can_find_all_by_status
    results = @repo.find_all_by_status('shipped')
    assert_equal 10, results.count
  end

  def test_can_find_by_status
    result = @repo.find_by_id(8)
    assert_equal '38', result.merchant_id
  end

  def test_returns_correct_number_of_invoice_items_for_invoice
    skip
    results = @repo.invoice('1')
    assert_equal 8, results.count
  end

  def test_returns_collection_of_items_for_invoice
    skip
    results = @repo.items_for_invoice('1')
    assert_equal 8, results.count
    assert results.include?('Item Autem Minima')
  end

  def test_can_find_customers_by_customer_id
    results = @repo.find_all_by_customer_id('5')
    assert_equal 2, results.count
  end
end
