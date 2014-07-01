require 'csv'
require_relative '../lib/customer'

class CustomerRepository
  attr_reader :customers

  def initialize(filename='./data/customers.csv')
    customer_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @customers = customer_data.collect do |customer|
      customer
    end
  end

  def find_by_last_name(last)
    @customers.detect do |customer|
      customer[2].downcase == last.downcase
    end
  end

  def find_all_by_first_name(first)
    @customers.find_all do |customer|
      customer[1].downcase == first.downcase
    end

  end

  def find_by_id(id)
    @customers.detect do |customer|
      customer[0] == id.to_s
    end
  end

  def count
    @customers.count
  end

end
