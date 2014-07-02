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

  def count
    @merchants.count
  end
end
