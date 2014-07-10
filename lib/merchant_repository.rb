require 'csv'
require_relative 'merchant'
require_relative 'parser'

class MerchantRepository
  attr_reader   :merchants,
                :engine

  def initialize(engine, data_path)
    @merchants = Parser.new.parse(data_path + '/merchants.csv', Merchant, self)
    @engine    = engine
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  def random
    merchants.sample
  end

  def all
    merchants
  end

  def find_by_id(id)
    merchants.find { |merchant| merchant.id.to_s == id.to_s }
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name == name }
  end

  def find_all_by_name(name)
    merchants.find_all { |merchant| merchant.name == name }
  end

  def revenue(date)
    merchants.map { |merchant| merchant.revenue(date) }
             .compact
             .reduce(0, :+)
  end

  def count
    merchants.count
  end
end
