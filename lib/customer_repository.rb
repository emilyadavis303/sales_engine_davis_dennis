require 'csv'
require_relative '../lib/customer'

class CustomerRepository
  attr_reader   :customers

  def initialize(filename='./data/transactions.csv')
    @customers           = []
    @customer_repository = CSV.open(filename, headers: true, header_converters: :symbol)

    build_records(@customer_repository)
  end

  def build_records(repository)
    @customers = repository.map {|row| Customer.new(row)}
  end

  def find_by_last_name(last_name)
    @customers.find {
      |customer| customer.last_name.downcase == last_name.downcase
    }
  end

  def find_all_by_first_name(first_name)
    @customers.find_all {
      |customer| customer.first_name.downcase == first_name.downcase
    }
  end

  def find_by_id(id)
    @customers.find {
      |customer| customer.id.to_s == id.to_s
    }
  end

  def count
    @customers.count
  end

end
