require 'csv'
require_relative '../lib/customer'

class CustomerRepository
  attr_reader   :customers

  def initialize(filename='./data/transactions.csv')
    @customer_repository = CSV.open(filename, headers: true, header_converters: :symbol)

    @customers = []

    build_records(@customer_repository)
  end

  def build_records(repository)
    @customers = repository.map {|row| Customer.new(row)}
  end

  def find_by_last_name(last_name)
    @customers.find do |customer|
      customer.last_name.downcase == last_name.downcase
    end
  end

  def find_all_by_first_name(first_name)
    @customers.find_all do |customer|
      customer.first_name.downcase == first_name.downcase
    end
  end

  def find_by_id(id)
    @customers.find do |customer|
      customer.id.to_s == id.to_s
    end
  end

  def count
    @customers.count
  end

end
