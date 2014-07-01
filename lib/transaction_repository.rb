require 'csv'
require_relative '../lib/transaction'
require 'pry'

class TransactionRepository
  attr_reader   :transaction_data,
                :transactions

  def initialize
    @transaction_repository = CSV.open('./test/fixtures/transactions_sample.csv', headers: true, header_converters: :symbol)

    @transactions = []

    build_records(@transaction_repository)
  end

  def build_records(repository)
    @transactions = repository.map {|row| Transaction.new(row)}
  end

  def find_by_credit_card_number(number)
    @transactions.find do |transaction|
      transaction.credit_card_number == number
    end
  end

  def find_all_by_result(result)
    @transactions.find_all do |transaction|
      transaction.result.downcase == result.downcase
    end
  end

  def find_by_id(id)
    @transactions.find do |transaction|
      transaction.id.to_s == id.to_s
    end
  end

  def count
    @transactions.count
  end
end
