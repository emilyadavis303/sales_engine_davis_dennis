require './test/test_helper'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  def setup
    @repo = InvoiceRepository.new("./test/fixtures/invoices_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end
end
