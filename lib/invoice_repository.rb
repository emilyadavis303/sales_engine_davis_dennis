require 'csv'
require_relative '../lib/invoice'

class InvoiceRepository
  attr_accessor :invoices

  def initialize(filename='./data/invoices.csv')
    invoice_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @invoices = invoice_data.collect do |invoice|
      invoice
    end

  end

  def count
    @invoices.count
  end
end
