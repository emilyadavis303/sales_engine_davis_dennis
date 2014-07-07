require 'csv'
require_relative 'merchant'
require_relative 'parser'

class MerchantRepository
  attr_reader   :merchants,
                :engine

  def initialize(engine, data_path='./data')
    @merchants = Parser.new.parse(data_path + '/merchants.csv', Merchant, self)
    @engine    = engine
  end

  def random
    merchants.shuffle.first
  end

  def all
    merchants
  end

  def find_by_id(id)
    merchants.find {
      |merchant| merchant.id.to_s == id.to_s
    }
  end

  def find_by_name(name)
    merchants.find {
      |merchant| merchant.name == name
    }
  end

  def find_all_by_name(name)
    merchants.find_all {
      |merchant| merchant.name == name
    }
  end

  def count
    merchants.count
  end
end
