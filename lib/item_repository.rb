require 'csv'
require_relative '../lib/item'

class ItemRepository
  attr_reader   :items

  def initialize(filename='./data/items.csv')
    @items           = []
    @item_repository = CSV.open(filename, headers: true, header_converters: :symbol)

    build_records(@item_repository)
  end

  def build_records(repository)
    @items = repository.map {|row| Item.new(row)}
  end

  def count
    @items.count
  end
end
