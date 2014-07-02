require 'csv'
require_relative '../lib/merchant'
require_relative '../lib/parser'

class MerchantRepository
  attr_reader   :merchants

  def initialize(filename='./data/merchants.csv')
    @merchants = Parser.new.parse(filename, Merchant)
  end

  def random
    @merchants.shuffle.first
  end

  def all
    @merchants
  end

  def find_by_name(name)
    @merchants.find {
      |merchant| merchant.name == name
    }
  end

  def find_all_by_name(name)
    @merchants.find_all {
      |merchant| merchant.name == name
    }
  end

  def count
    @merchants.count
  end
end
