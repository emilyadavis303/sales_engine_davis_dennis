require 'date'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo_ref

  def initialize(row, repo_ref)
    @id           = row[:id].to_i
    @name         = row[:name]
    @created_at   = Date.parse(row[:created_at])
    @updated_at   = Date.parse(row[:updated_at])
    @repo_ref     = repo_ref
  end

  def items
    repo_ref.engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    repo_ref.engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def revenue(date=nil)
    invoices_for_date(date).map(&:total).reduce(:+)
  end

  def favorite_customer
    customer_id = invoices.select(&:successful?)
                          .group_by(&:customer_id)
                          .max_by { |key, values| values.count }
                          .first

    repo_ref.engine.customer_repository.find_by_id(customer_id)
  end

  def customers_with_pending_invoices
    invoices.reject(&:successful?)
            .collect(&:customer)
  end

  private

  def invoices_for_date(date = nil)
    successful_invoices = invoices.select(&:successful?)

    if date
      successful_invoices.select { |invoice| invoice.updated_at == date }
    else
      successful_invoices
    end
  end
end
