require 'csv'
require 'bigdecimal'
require_relative 'item'
require_relative 'parser'

class ItemRepository
  attr_reader   :items,
                :engine

  def initialize(engine, data_path='./data')
    @items  = Parser.new.parse(data_path + '/items.csv', Item, self)
    @engine = engine
  end

  def random
    items.shuffle.first
  end

  def all
    items
  end

  def find_by_name(name)
    items.find {
      |item| item.name == name
    }
  end

  def find_all_by_name(name)
    items.find_all {
      |item| item.name == name
    }
  end

  def find_all_by_merchant_id(merchant_id)
    items.find_all {
      |item| item.merchant_id == merchant_id
    }
  end

  def find_by_id(id)
    items.find {
      |item| item.id.to_s == id.to_s
    }
  end

  def invoice_items(id)
    engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant(merchant_id)
    engine.merchant_repository.find_by_id(merchant_id)
  end

  def count
    items.count
  end
end
