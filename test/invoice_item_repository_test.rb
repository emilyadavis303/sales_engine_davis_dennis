require './test/test_helper'
require 'csv'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_item'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :invoice_item_repository

  def setup
    @repo = InvoiceItemRepository.new("./test/fixtures/invoice_items_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_invoice_items
    assert @repo.count >= 10
  end
end
