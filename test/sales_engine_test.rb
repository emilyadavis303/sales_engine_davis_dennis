require './test/test_helper'
require 'csv'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'

class SalesEngineTest < Minitest::Test
  def test_it_exists
    engine = SalesEngine.new

    assert engine
  end

  def test_it_loads_the_file
    engine = SalesEngine.new
    assert engine.startup
  end

  def test_it_loads_repositories
    engine = SalesEngine.new
    engine.startup
    assert engine.merchant_repository
    assert engine.item_repository
    assert engine.invoice_repository
  end
end
