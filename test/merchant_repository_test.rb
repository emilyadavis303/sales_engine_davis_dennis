require './test/test_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/sales_engine'
require 'pry'

class MerchantRepositoryTest < Minitest::Test
  def setup
    engine = SalesEngine.new
    engine.startup('test/fixtures/')
    @repo ||= MerchantRepository.new(engine, "test/fixtures/")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end

  def test_can_find_a_single_merchant_by_name
    result = @repo.find_by_name('Osinski, Pollich and Koelpin')
    assert_equal 'Osinski, Pollich and Koelpin', result.name
    assert_equal '8', result.id
  end

  def test_can_find_all_merchants_by_name
    results = @repo.find_all_by_name('Williamson Group')
    assert_equal 2, results.count
  end

  def test_merchant_has_the_correct_number_of_items
    results = @repo.items_for_merchant('3')
    assert_equal 4, results.count
    # assert 'Item Autem Minima', results.find('Item Autem Minima')
  end

  def test_returns_correct_invoice_number_for_merchant
    results = @repo.invoices_for_merchant('3')
    assert_equal 2, results.count
  end
end
