require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/merchant_repository'
require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test
  def setup
    @merchant = Merchant.new(data, @repo_ref)
  end

  def data
    { :id=>         '1',
      :name=>       'Schroeder-Jerde',
      :created_at=> '2012-03-27 14:53:59 UTC',
      :updated_at=> '2012-03-27 14:53:59 UTC'
    }
  end

  def test_it_has_attributes
    @merchant.id
    @merchant.name
    @merchant.created_at
    @merchant.updated_at
  end

  def test_a_merchant_knows_its_attributes
    assert_equal 1, @merchant.id
    assert_equal 'Schroeder-Jerde', @merchant.name
    assert_equal '2012-03-27 14:53:59 UTC', @merchant.created_at
    assert_equal '2012-03-27 14:53:59 UTC', @merchant.updated_at
  end

  def test_returns_correct_number_of_items
    sales_engine = SalesEngine.new('test/fixtures')
    sales_engine.startup
    @merchant_test = sales_engine.merchant_repository.find_by_id(3)

    results = @merchant_test.items
    assert_equal 4, results.count
    # assert 'Item Autem Minima', results.find('Item Autem Minima')
  end

  def test_returns_correct_number_of_invoices_for_merchant
    sales_engine = SalesEngine.new('test/fixtures')
    sales_engine.startup
    @merchant_test = sales_engine.merchant_repository.find_by_id(3)

    results = @merchant_test.invoices
    assert_equal 2, results.count
  end
end
