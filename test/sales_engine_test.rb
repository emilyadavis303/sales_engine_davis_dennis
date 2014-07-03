require './test/test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  def setup
     @repo ||= begin
       engine = SalesEngine.new
       engine.startup('./test/fixtures/')
       engine.merchant_repository
       engine.item_repository
       engine.invoice_repository
       engine.invoice_item_repository
       engine.customer_repository
       engine.transaction_repository
     end
   end

  def test_it_exists
    engine = SalesEngine.new

    assert engine
  end

  # def test_it_loads_the_file
  #   engine = SalesEngine.new
  #   assert engine.startup('./test/fixtures/')
  # end
  #
  # def test_it_loads_repositories
  #   engine = SalesEngine.new
  #   engine.startup('./test/fixtures/')
  #   assert engine.merchant_repository
  #   assert engine.item_repository
  #   assert engine.invoice_repository
  #   assert engine.invoice_item_repository
  #   assert engine.customer_repository
  #   assert engine.transaction_repository
  # end
end
