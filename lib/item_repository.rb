require 'csv'
require 'bigdecimal'
require_relative '../lib/item'
require_relative '../lib/parser'

class ItemRepository
  attr_reader   :items, :engine

  def initialize(engine, data_path='./data/')
    @items = Parser.new.parse(data_path + 'items.csv', Item, self)
    @engine = engine
  end

  def random
    @items.shuffle.first
  end

  def all
    @items
  end

  def find_by_name(name)
    @items.find {
      |item| item.name == name
    }
  end

  def find_all_by_name(name)
    @items.find_all {
      |item| item.name == name
    }
  end

  def find_all_by_merchant_id(merchant_id)
    @items.find_all {
      |item| item.merchant_id == merchant_id
    }
  end

  def count
    @items.count
  end
end
