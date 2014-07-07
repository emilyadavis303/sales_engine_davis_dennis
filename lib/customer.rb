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
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo_ref    = repo_ref
  end

  def invoices
    repo_ref.engine.invoice_repository.find_all_by_customer_id(@id)
  end

end
