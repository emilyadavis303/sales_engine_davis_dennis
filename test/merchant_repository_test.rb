require './test/test_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test
  def setup
    engine = SalesEngine.new('test/fixtures')
    engine.startup
    @repo ||= MerchantRepository.new(engine, 'test/fixtures')
  end

  def test_it_exists
    assert @repo
  end

  def test_loads_all_merchants
    results = @repo.all
    assert_equal 11, results.count
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end

  def test_can_find_a_single_merchant_by_name
    result = @repo.find_by_name('Osinski, Pollich and Koelpin')
    assert_equal 'Osinski, Pollich and Koelpin', result.name
    assert_equal 8, result.id
  end

  def test_can_find_all_merchants_by_name
    results = @repo.find_all_by_name('Williamson Group')
    assert_equal 2, results.count
  end

  def test_it_returns_total_revenue_across_all_merchants_for_a_particular_date
    results = @repo
    date = Date.parse('2012-03-24 15:54:10 UTC')

    assert_equal BigDecimal("373.42"), results.revenue(date)
  end
end
