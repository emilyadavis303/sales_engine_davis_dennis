class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo_ref

  def initialize(row, repo_ref)
    @id           = row[:id].to_i
    @name         = row[:name]
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @repo_ref     = repo_ref
  end

  def items
    repo_ref.engine.item_repository.find_all_by_merchant_id(@id)
  end

  def invoices
    repo_ref.engine.invoice_repository.find_all_by_merchant_id(@id)
  end

  def revenue
    successful_invoices = invoices.select {|invoice| invoice.successful?}
    successful_invoices.map(&:total).reduce(:+)
    # successful_invoices.reduce(0) {|total, invoice| total += invoice.total}
  end

end
