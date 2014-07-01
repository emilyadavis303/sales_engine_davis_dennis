require './test/test_helper'
require 'csv'
require_relative '../lib/merchant_repository'

class MerchantsRepositoryTest < Minitest::Test
  attr_reader :merchant_repository

  def setup
    @repo = MerchantRepository.new("./test/fixtures/merchants_sample_data.csv")
  end

  def test_it_exists
    # binding.pry
    assert @repo
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end

  # def test_if_merchants_were_really_created
  #   assert_equal 'Willms and Sons', @repo.name.include?
  # end

end
