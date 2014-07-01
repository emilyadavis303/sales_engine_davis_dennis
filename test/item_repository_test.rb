require './test/test_helper'
require 'csv'
require_relative '../lib/item_repository'

class ItemsRepositoryTest < Minitest::Test
  attr_reader :item_repository

  def setup
    @repo = ItemRepository.new("./test/fixtures/items_sample_data.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end

  # def test_if_items_were_really_created
  #   assert_equal 'Item Nemo Facere', @repo.name.include?
  # end

end
