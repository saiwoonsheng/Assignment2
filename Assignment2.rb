require 'spreadsheet'

Spreadsheet.client_encoding = 'UTF-8'

book = Spreadsheet::Workbook.new
sheet1 = book.create_worksheet :name => 'Assignment2'
j = 0 

begin
loop do   
  puts "Enter first number :"
  f = gets.chomp.to_i
  puts "Enter second number :"
  s = gets.chomp.to_i
  puts "Enter Operation ( + , - , * , / )"
  op = gets.chomp
  if op == "+" 
  ans = f+s
 elsif op == "-" 
  ans = f-s
 elsif op == "*" 
  ans = f*s
 elsif op == "/" 
  ans = f/s
end

time = Time.new
sheet1.row(j).push f, op, s, '=', ans, time.inspect

format = Spreadsheet::Format.new :horizontal_align => :centre
sheet1.row(j).default_format = format
sheet1.column(5).width = 28
j = j + 1

  puts "Do You Want to Do Another ( y / n )? "
  i = gets.chomp
  break if i == "n"  
rescue Exception => e
puts e.message + " is Error."
end
end

   
book.write Dir.pwd+'\Assignment2.xls'