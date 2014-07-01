require 'csv'
require_relative '../lib/item'

class ItemRepository
  attr_accessor :items

  def initialize(filename='./data/items.csv')
    item_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @items = item_data.collect do |item|
      item
    end

  end

  def count
    @items.count
  end
end
