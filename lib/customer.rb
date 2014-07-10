require 'date'

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repo_ref

  def initialize(row, repo_ref)
    @id          = row[:id].to_i
    @first_name  = row[:first_name]
    @last_name   = row[:last_name]
    @created_at  = Date.parse(row[:created_at])
    @updated_at  = Date.parse(row[:updated_at])
    @repo_ref    = repo_ref
  end

  def invoices
    repo_ref.engine.invoice_repository.find_all_by_customer_id(id)
  end

  def transactions
    invoices.flat_map do |invoice|
      repo_ref.engine.transaction_repository.find_all_by_invoice_id(invoice.id)
    end
  end

  def favorite_merchant
    merchant_id = invoices.select(&:successful?)
                          .group_by(&:merchant_id)
                          .max_by { |key, values| values.count }
                          .first

    repo_ref.engine.merchant_repository.find_by_id(merchant_id)
  end
end
