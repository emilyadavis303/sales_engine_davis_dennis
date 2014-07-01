require 'csv'
require_relative '../lib/invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items, :invoice_id

  def initialize(filename='./data/invoice_items.csv')
    item_data = CSV.open(filename, headers: true, header_converters: :symbol)
    @invoice_items = item_data.collect { |item| item }
  end

  def count
    @invoice_items.count
  end

  def find_by_item_id(id)
    @invoice_items.detect { |item| id.to_s == item[0] }
  end

  def find_all_by_quanity(quantity)
    @invoice_items.select { |item| quantity.to_s == item[3] }
  end

  def find_by_id(invoice_id)
    @invoice_items.detect { |item| invoice_id.to_s == item[2] }
  end

end
