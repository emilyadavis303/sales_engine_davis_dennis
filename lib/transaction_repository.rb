require 'csv'
require_relative '../lib/transaction'

class TransactionRepository
  attr_reader :transaction

  def initialize(filename='./data/transactions.csv')
    transaction_data = CSV.open(filename, headers: true, header_converters: :symbol)

    @transactions = transaction_data.collect do |transaction|
      transaction
    end

  end

  def count
    @transactions.count
  end
end
