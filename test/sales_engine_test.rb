gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant_repository'

class SalesEngineTest < Minitest::Test
  def test_it_exists
    engine = SalesEngine.new

    assert engine
  end

  def test_it_loads_the_file
    engine = SalesEngine.new
    assert engine.startup
  end

  def test_it_loads_merchant_repository
    engine = SalesEngine.new
    engine.startup
    assert engine.merchant_repository
    assert engine
  end
end
