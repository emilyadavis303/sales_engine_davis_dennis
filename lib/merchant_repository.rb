require_relative '../lib/merchant'

class MerchantRepository
  attr_reader   :merchants

  def initialize(filename='./data/merchants.csv')
    merchant_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @merchants = merchant_data.collect do |merchant|
      merchant
    end

  end

  def count
    @merchants.count
  end
end
