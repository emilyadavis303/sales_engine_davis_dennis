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

  def inspect
    "#<#{self.class} #{@items.size} rows>"
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

  def find_by_unit_price(unit_price)
    items.find {
      |item| item.unit_price == unit_price
    }
  end

  def count
    items.count
  end
end
