require 'csv'
require_relative '../lib/merchant'
require_relative '../lib/parser'

class MerchantRepository
  attr_reader   :merchants

  def initialize(engine_ref, filename='./data/merchants.csv')
    @merchants = Parser.new.parse(filename, Merchant, self)
    @engine_ref = engine_ref
  end

  def random
    @merchants.shuffle.first
  end

  def all
    @merchants
  end

  def find_by_id(id)
    @merchants.find {
      |merchant| merchant.id.to_s == id.to_s
    }
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

  def items(merchant_obj)
    id  = merchant_obj.id
    repo = merchant_obj.repo_ref
    #call to @engine_ref
    #pass instance of repo to ingine
    #find all items by merch_id
    #return collection
  end
end
