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

  def test_returns_correct_number_of_transactions_for_invoice
    results = @repo.transactions('2')
    assert 3, results.count
  end

  def test_returns_correct_number_of_invoice_items_for_invoice
    results = @repo.invoice_items('1')
    assert_equal 9, results.count
  end

  def test_it_can_find_customer_by_id
    result = @repo.customer('10')
    assert_equal 'Ramona', result.first_name
  end

  def test_it_can_find_a_merchant_associated_with_transaction
    result = @repo.merchant('3')
    assert_equal 'Willms and Sons', result.name
  end

  def test_returns_collection_of_items_for_invoice
    results = @repo.items('1')

    assert_equal 9, results.count
    assert results.map(&:name).include? 'Item Quae Dolore'
    assert results.map(&:name).include? 'Item Nulla Aut'
    assert results.map(&:id).include? '539'
  end
end
