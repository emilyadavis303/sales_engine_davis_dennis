require 'csv'
require 'date'
require 'time'
require_relative 'invoice'
require_relative 'parser'

class InvoiceRepository
  attr_reader   :invoices,
                :engine

  def initialize(engine, data_path)
    @invoices = Parser.new.parse(data_path + '/invoices.csv', Invoice, self)
    @engine   = engine
  end

  def inspect
    "#<#{self.class} #{invoices.size} rows>"
  end

  def random
    invoices.sample
  end

  def all
    invoices
  end

  def find_by_status(status)
    invoices.find { |invoice| invoice.status == status }
  end

  def find_all_by_status(status)
    invoices.find_all { |invoice| invoice.status == status }
  end

  def find_by_id(id)
    invoices.find { |invoice| invoice.id == id }
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.find_all { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_customer_id(customer_id)
    invoices.find_all { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_date(created_at)
    invoices.find_all { |invoice| invoice.created_at == created_at }
  end

  def count
    invoices.count
  end
end
