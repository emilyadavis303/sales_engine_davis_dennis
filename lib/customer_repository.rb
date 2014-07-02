require 'csv'
require_relative '../lib/customer'
require_relative '../lib/parser'

class CustomerRepository
  attr_reader   :customers

  def initialize(engine_ref, filename='./data/customers.csv')
    @customers = Parser.new.parse(filename, Customer, self)
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
