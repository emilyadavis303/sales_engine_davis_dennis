require_relative '../lib/merchant_repository'

class SalesEngine
  attr_reader :merchant_repository

  def initialize

  end

  def startup
    @merchant_repository = MerchantRepository.new
  end

  def count
  end

end
