require 'csv'
require_relative '../lib/merchant'
require_relative '../lib/parser'
require 'pry'

class MerchantRepository
  attr_reader   :merchants, :engine

  def initialize(engine, data_path='./data/')
    @merchants = Parser.new.parse(data_path + 'merchants.csv', Merchant, self)
    @engine = engine
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

  def items_for_merchant(id)
    engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices_for_merchant(id)
    engine.invoice_repository.find_all_by_merchant_id(id)
  end
end
