require './test/test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(id: '4', invoice_id: '5', credit_card_number: '4515551623735607')
  end

  def test_a_transaction_has_attributes
    assert_equal '4', @transaction.id
    assert_equal '5', @transaction.invoice_id
    assert_equal '4515551623735607', @transaction.credit_card_number
  end
end
