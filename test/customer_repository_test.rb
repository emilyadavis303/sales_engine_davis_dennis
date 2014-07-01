require './test/test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :customer_repository

  def setup
    @repo = CustomerRepository.new("./test/fixtures/customers_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_customers
    assert @repo.count >= 10
  end

  def test_can_find_a_customer_by_last_name
    assert_equal @repo.customers[4], @repo.find_by_last_name('Nader')
  end

  def test_can_find_a_customer_by_first_name
    assert_equal @repo.customers[7], @repo.find_all_by_first_name('Loyal').first
  end

  def test_can_find_a_customer_by_id
    assert_equal @repo.customers[2], @repo.find_by_id('3')
  end
end
