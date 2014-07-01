require './test/test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  def setup
    @repo = TransactionRepository.new
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_transactions
    assert @repo.count >= 10
  end

  def test_it_can_find_a_transaction_by_cc_number
    result = @repo.find_by_credit_card_number('4203696133194408')
    assert result.credit_card_number, '4203696133194408'
    assert result.id, '5536'
  end

  # def test_it_can_find_all_by_result
  #   result = @repo.find_by_status('success')
  # end

end
