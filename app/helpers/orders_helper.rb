module OrdersHelper
  def parse(raw_file)
    data = raw_file.try(:read)
    return unless data

    data.each_line do |row|
      Order.create_from(row) unless row.include?("Comprador")
    end
  end
  
  def reverse(sorting)
    sorting.to_sym == :asc ? :desc : :asc
  end
end