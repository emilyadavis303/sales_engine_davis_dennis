require 'csv'
require_relative '../lib/invoice'

class InvoiceRepository
  attr_reader   :invoices

  def initialize(filename='./data/invoices.csv')
    @invoices           = []
    @invoice_repository = CSV.open(filename, headers: true, header_converters: :symbol)

    build_records(@invoice_repository)
  end

  def build_records(repository)
    @invoices = repository.map {|row| Invoice.new(row)}
  end

  def count
    @invoices.count
  end
end
