require 'pry'
puts "Welcome to blackjack!"


def total(card)
	total=0
	cardnumer=[]
	cardnumercopy=[]
	cardnumer=card.map {|x| x[0]}
	cardnumercopy=card.map {|x| x[0]}
	cardnumer.each do |v|
		if v=="A"
			total+=11
		elsif v=="J" || v=="Q" || v=="K"
			total+=10
		else
			total+=v.to_i
		end
	end
   
	while total>21 && cardnumercopy.include?("A")
		total-=10
		cardnumer.delete_at(cardnumercopy.index("A"))
	end
	total		
end


# def total(cards) 
#   # [['H', '3'], ['S', 'Q'], ... ]
#   arr = cards.map{|e| e[1] }

#   total = 0
#   arr.each do |value|
#     if value == "A"
#       total += 11
#     elsif value.to_i == 0 # J, Q, K
#       total += 10
#     else
#       total += value.to_i
#     end
#   end

#   #correct for Aces
#   arr.select{|e| e == "A"}.count.times do
#     total -= 10 if total > 21
#   end

#   total
# end


number=['2','3','4','5','6','7','8','9','10','J','Q','K']
suit=['H','D','S','C']
card= number.product(suit)
card.shuffle!


mycard=[]
dealercard=[]

mycard<<card.pop
dealercard<<card.pop
mycard<<card.pop
dealercard<<card.pop

dealertotal=total(dealercard)
mytotal=total(mycard)

puts "Dealer has: #{dealercard[0]} and #{dealercard[1]}, for a total of #{dealertotal}"
puts "You have: #{mycard[0]} and #{mycard[1]}, for a total of: #{mytotal}"
puts 'Do you want to: 1)stand 2)hit'
stand_hit=gets.chomp
if stand_hit=='1'
	mycard<<card.pop
else
	dealercard<<card.pop




