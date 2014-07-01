require './test/test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  def setup
    @repo = MerchantRepository.new("./test/fixtures/merchants_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end

  # def test_if_merchants_were_really_created
  #   assert_equal 'Willms and Sons', @repo.name.include?
  # end

end
