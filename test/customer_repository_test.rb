require './test/test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :customer_repository

  def setup
    @repo = CustomerRepository.new('test/fixtures/customers_sample.csv')
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
end
