require 'csv'
require 'bigdecimal'
require_relative '../lib/item'
require_relative '../lib/parser'

class ItemRepository
  attr_reader   :items

  def initialize(engine_ref, filename='./data/items.csv')
    @items = Parser.new.parse(filename, Item, self)
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

  def count
    @items.count
  end
end
