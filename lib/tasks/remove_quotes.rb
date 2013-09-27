file_name = 'hcd_violations.txt'

text = File.read(file_name)

text.gsub! ?", ?'

out_file = File.new('vio.txt', 'w')
out_file.puts(text)
out_file.close
