require 'csv'
require_relative '../lib/merchant'

class MerchantRepository
  attr_reader   :merchants

  def initialize(filename='./data/merchants.csv')
    @merchants           = []
    @merchant_repository = CSV.open(filename, headers: true, header_converters: :symbol)

    build_records(@merchant_repository)
  end

  def build_records(repository)
    @merchants = repository.map {|row| Merchant.new(row)}
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
