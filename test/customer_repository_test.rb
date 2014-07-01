require './test/test_helper'
require 'csv'
require_relative '../lib/customer_repository'
require_relative '../lib/customer'

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
end
