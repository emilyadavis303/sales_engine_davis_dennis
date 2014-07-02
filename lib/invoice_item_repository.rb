require 'csv'
require_relative '../lib/invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(filename='./data/invoice_items.csv')
    @invoice_item_repository = CSV.open(filename, headers: true, header_converters: :symbol)

    @invoice_items = []

    build_records(@invoice_item_repository)
  end

  def build_records(repository)
    @invoice_items = repository.map {|row| InvoiceItem.new(row)}
  end

  def find_by_item_id(item_id)
    @invoice_items.find {
      |invoice_item| invoice_item.item_id.to_s == item_id.to_s
    }
  end

  def find_all_by_quanity(quantity)
    @invoice_items.find_all {
      |invoice_item| invoice_item.quantity.to_s == quantity
    }
  end

  def find_by_id(id)
    @invoice_items.find {
      |invoice_item| invoice_item.id.to_s == id.to_s
    }
  end

  def count
    @invoice_items.count
  end
end
