require 'csv'
require_relative 'transaction'
require_relative 'parser'

class TransactionRepository
  attr_reader :transactions,
              :engine

  def initialize(engine, data_path)
    @transactions =
      Parser.new.parse(data_path + '/transactions.csv', Transaction, self)
    @engine       = engine
  end

  def inspect
    "#<#{self.class} #{transactions.size} rows>"
  end

  def random
    transactions.sample
  end

  def all
    transactions
  end

  def find_by_credit_card_number(number)
    transactions.find { |x| x.credit_card_number == number }
  end

  def find_all_by_result(result)
    transactions.find_all { |x| x.result.downcase == result.downcase }
  end

  def find_all_invoices_by_result(invoice_id, result)
    transactions.find_all { |x| x(invoice_id).result == result }
  end

  def find_by_id(id)
    transactions.find { |x| x.id.to_s == id.to_s }
  end

  def find_all_by_invoice_id(invoice_id)
    transactions.find_all { |x| x.invoice_id == invoice_id }
  end

  def count
    transactions.count
  end
end
