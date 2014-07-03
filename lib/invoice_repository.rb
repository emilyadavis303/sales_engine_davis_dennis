require 'csv'
require_relative '../lib/invoice'
require_relative '../lib/parser'

class InvoiceRepository
  attr_reader   :invoices, :engine

  def initialize(engine, data_path='./data/')
    @invoices = Parser.new.parse(data_path + 'invoices.csv', Invoice, self)
    @engine = engine
  end

  def random
    @invoices.shuffle.first
  end

  def all
    @invoices
  end

  def find_by_status(status)
    @invoices.find {
      |invoice| invoice.status == status
    }
  end

  def find_all_by_status(status)
    @invoices.find_all {
      |invoice| invoice.status == status
    }
  end

  def find_by_id(id)
    @invoices.find {
      |invoice| invoice.id.to_s == id.to_s
    }
  end

  def count
    @invoices.count
  end
end
