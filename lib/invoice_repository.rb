require 'csv'
require_relative '../lib/invoice'
require_relative '../lib/parser'

class InvoiceRepository
  attr_reader   :invoices

  def initialize(filename='./data/invoices.csv')
    @invoices = Parser.new.parse(filename, Invoice)
  end

  def count
    @invoices.count
  end
end
