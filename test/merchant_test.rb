gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant'
require_relative '../lib/merchant_repository'

class MerchantTest < Minitest::Test
  def setup
    @repository = MerchantRepository.new
    # merchant = Merchant.new(row)
  end

  def test_a_merchant_has_attributes
    assert @repository.merchants.first.name.match('Schroeder-Jerde')
  end
end


 # def test_name_attribute_exists
 #   @merchant_repository
 #   # looking for the name attribute in the merchants array
 #   assert @merchant_repository.merchants.first.name.match('Schroeder-Jerde')
 #  #  assert @merchant_repository.merchants.name.find('Cummings-Thiel')
 # end
