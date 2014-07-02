require 'csv'
require_relative '../lib/invoice_item'
require_relative '../lib/parser'

class InvoiceItemRepository
  attr_reader   :invoice_items

  def initialize(engine_ref, filename='./data/invoice_items.csv')
    @invoice_items = Parser.new.parse(filename, InvoiceItem, self)
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

  def count
    @invoice_items.count
  end
end
