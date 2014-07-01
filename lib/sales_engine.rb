require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_item_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :item_repository,
              :invoice_repository


  def startup
    @merchant_repository     = MerchantRepository.new
    @item_repository         = ItemRepository.new
    @invoice_repository      = InvoiceRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
  end

end
