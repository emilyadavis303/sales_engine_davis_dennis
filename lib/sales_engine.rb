require_relative '../lib/merchant_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :item_repository


  def startup
    @merchant_repository = MerchantRepository.new
    @item_repository     = ItemRepository.new
  end

end
