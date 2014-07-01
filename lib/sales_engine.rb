require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/customer_repository'
require_relative '../lib/transaction_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :item_repository,
              :invoice_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository


  def startup
    @merchant_repository     = MerchantRepository.new
    @item_repository         = ItemRepository.new
    @invoice_repository      = InvoiceRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
    @customer_repository     = CustomerRepository.new
    @transaction_repository  = TransactionRepository.new
  end

end
