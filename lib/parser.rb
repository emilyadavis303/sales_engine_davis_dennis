class Parser

  def parse(filename, klass)
    repository = CSV.open(filename, headers: true, header_converters: :symbol)
    repository.map {|row| klass.new(row)}
  end

end
