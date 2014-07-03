require 'csv'
require_relative '../lib/invoice_item'
require_relative '../lib/parser'

class InvoiceItemRepository
  attr_reader   :invoice_items, :engine

  def initialize(engine, data_path='./data/')
    @invoice_items = Parser.new.parse(data_path + 'invoice_items.csv', InvoiceItem, self)
    @engine = engine
  end

  def random
    @invoice_items.shuffle.first
  end

  def all
    @invoice_items
  end

  def find_by_item_id(item_id)
    @invoice_items.find {
      |item| item.item_id.to_s == item_id.to_s
    }
  end

  def find_all_by_quanity(quantity)
    @invoice_items.find_all {
      |item| item.quantity == quantity.to_s
    }
  end

  def find_by_id(id)
    @invoice_items.find {
      |item| item.id.to_s == id.to_s
    }
  end

  def find_all_by_invoice_id(invoice_id)
    @invoice_items.find_all {
      |item| item.invoice_id.to_s == invoice_id.to_s
    }
  end

  def count
    @invoice_items.count
  end
end
