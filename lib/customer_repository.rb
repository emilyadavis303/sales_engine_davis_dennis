require_relative '../lib/customer'

class CustomerRepository
  attr_accessor :customers

  def initialize(filename='./data/customers.csv')
    customer_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @customers = customer_data.collect do |customer|
      customer
    end

  end

  def count
    @customers.count
  end
end
