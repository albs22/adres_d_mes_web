require 'csv'

file_name = 'vio.txt'

CSV.foreach(file_name, :headers => true, :col_sep => ?;) do |row|
  puts(row.to_hash)
  puts
  puts
end
