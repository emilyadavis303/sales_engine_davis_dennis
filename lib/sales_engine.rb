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

  def startup(data_path)
    @merchant_repository     = MerchantRepository.new(self)
    @item_repository         = ItemRepository.new(self, data_path + 'items.csv')
    @invoice_repository      = InvoiceRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @customer_repository     = CustomerRepository.new(self)
    @transaction_repository  = TransactionRepository.new(self)
  end

end
