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

  def revenue(date=nil)
    if date != nil
      invoices_for_date = invoices.select {|invoice| invoice.created_at == date}
      successful_invoices = invoices_for_date.select {|invoice| invoice.successful?}
    else
      successful_invoices = invoices.select {|invoice| invoice.successful?}
    end
    successful_invoices.map(&:total).reduce(:+)
  end

  def favorite_customer
    #gather invoices for merchant
    #filter those for success
    #filter for customer with largest number if invoices
    #return customer object (find by id)
  end
end
