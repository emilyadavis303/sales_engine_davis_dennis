require 'csv'
require_relative '../lib/transaction'
require_relative '../lib/parser'

class TransactionRepository
  attr_reader :transactions

  def initialize(filename='./data/transactions.csv')
    @transactions = Parser.new.parse(filename, Transaction)
  end

  def find_by_credit_card_number(number)
    @transactions.find {
      |transaction| transaction.credit_card_number == number
    }
  end

  def find_all_by_result(result)
    @transactions.find_all { |transaction|
      transaction.result.downcase == result.downcase
    }
  end

  def find_by_id(id)
    @transactions.find {
      |transaction| transaction.id.to_s == id.to_s
    }
  end

  def count
    @transactions.count
  end
end
