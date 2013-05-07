require 'pry'

puts 'What is the first number?'
num1 = gets.chomp

puts 'What is the second number?'
num2 = gets.chomp

puts "The numers are #{num1} of class #{num1.class.to_s} and #{num2} of class #{num2.class.to_s}"

puts 'What operation would you like to perform? 1) add 2)sub 3) multiply 4) divide'
operation = gets.chomp

def some_method
	num1=5
end

if operation=='1'
	binding.pry #control+d to get the result
	result=num1.to_i + num2.to_i
elsif operation =='2'
	result=num1.to_i - num2.to_i
elsif operation =='3'
	result=num1.to_i * num2.to_i
else operation =='4'
	result=num1.to_f / num2.to_f
end
puts "Result is #{result.to_s}"
