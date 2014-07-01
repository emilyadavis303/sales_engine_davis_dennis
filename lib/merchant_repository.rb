require_relative '../lib/merchant'

class MerchantRepository
  attr_accessor :merchant_repository,
                :merchants

  def initialize(filename='./data/merchants.csv')
    @merchant_repository = CSV.open(filename, headers: true, header_converters: :symbol)
    @merchants           = []
    
    build_merchant_repository(merchants)
  end

  def build_merchant_repository(merchants)
    @merchant_repository.each do |row|
      @merchants << Merchant.new(row)
    end
  end

  def count
    @merchants.count
  end
end
