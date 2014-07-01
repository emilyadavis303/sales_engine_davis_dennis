gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant_repository'

class MerchantsRepositoryTest < Minitest::Test
  attr_reader :merchant_repository

  def setup
    @merchants = MerchantRepository.new("./test/fixtures/merchants_sample_data.csv")
  end

  def test_it_exists
    assert @merchants
  end

  def test_a_repository_loads_merchants
    assert @merchants.count >= 10
  end

end
