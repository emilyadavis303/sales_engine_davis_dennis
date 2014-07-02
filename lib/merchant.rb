class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row, repo_ref)
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repo_ref    = repo_ref
  end

end
