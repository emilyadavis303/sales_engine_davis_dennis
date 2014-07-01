require_relative '../lib/invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(filename='./data/invoice_items.csv')
    invoice_item_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @invoice_items = invoice_item_data.collect do |invoice_item|
      invoice_item
    end

  end

  def count
    @invoice_items.count
  end
end
