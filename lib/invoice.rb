class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repo_ref

  def initialize(row, repo_ref)
    @id            = row[:id].to_i
    @customer_id   = row[:customer_id].to_i
    @merchant_id   = row[:merchant_id].to_i
    @status        = row[:status]
    @created_at    = row[:created_at]
    @updated_at    = row[:updated_at]
    @repo_ref      = repo_ref
  end

  def customer
    repo_ref.engine.customer_repository.find_by_id(@customer_id)
  end

end
