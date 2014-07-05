require './test/test_helper'
require_relative '../lib/customer_repository'
require_relative '../lib/sales_engine'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :customer_repository

  def setup
    engine = SalesEngine.new
    engine.startup('test/fixtures/')
    @repo ||= CustomerRepository.new(engine, 'test/fixtures/')
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_customers
    assert @repo.count >= 10
  end

  def test_can_find_a_customer_by_last_name
    result = @repo.find_by_last_name('Considine')
    assert_equal 'Considine', result.last_name
    assert_equal 'Loyal', result.first_name
  end

  def test_can_find_multiple_customers_by_first_name
    result = @repo.find_all_by_first_name('Joey')
    assert_equal 2, result.count
  end

  def test_can_find_a_customer_by_id
    result = @repo.find_by_id(9)
    assert_equal 'Fadel', result.last_name
  end

  def test_it_can_return_correct_number_of_invoices_for_customer
    results = @repo.invoices('5')
    assert_equal 2, results.count
  end
end
