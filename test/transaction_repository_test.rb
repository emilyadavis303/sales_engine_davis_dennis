require './test/test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  def setup
    @repo = TransactionRepository.new("./test/fixtures/transactions_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_transactions
    assert @repo.count >= 10
  end
end
