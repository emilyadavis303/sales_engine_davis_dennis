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

  def test_can_find_a_single_merchant_by_name
    result = @repo.find_by_name('Osinski, Pollich and Koelpin')
    assert_equal 'Osinski, Pollich and Koelpin', result.name
    assert_equal '8', result.id
  end

  def test_can_find_all_merchants_by_name
    result = @repo.find_all_by_name('Williamson Group')
    assert_equal 2, result.count
  end
end
