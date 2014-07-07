require './test/test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  def setup
    engine = SalesEngine.new('test/fixtures')
    engine.startup
    @repo ||= InvoiceRepository.new(engine, 'test/fixtures')
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
end
