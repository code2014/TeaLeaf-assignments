require 'pry'

def init
  card=[]
  mycard=[]
  dealercard=[]
  number=['2','3','4','5','6','7','8','9','10','J','Q','K']
  suit=['H','D','S','C']
  card= number.product(suit)
  card.shuffle!
  mycard<<card.pop
  dealercard<<card.pop
  mycard<<card.pop
  dealercard<<card.pop
  [mycard,dealercard,card]
end

def welcome
	puts "What's your name?"
	name=gets.chomp
	puts "Hi,#{name}! Welcome to blackjack!"
end

def total(card)
  total=0
  cardnumer=[]
  cardnumer=card.map {|x| x[0]}
  
  cardnumer.each do |v|
    if v=="A"
      total+=11
    elsif v=="J" || v=="Q" || v=="K"
      total+=10
    else
      total+=v.to_i
    end
  end
   
  while total>21 && cardnumer.include?("A")
    total-=10
    cardnumer.delete_at(cardnumer.index("A"))
  end
  total		
end


def dealer_hit(dealercard,mycard,card)
	while total(dealercard)<17
		dealercard<<card.pop
	end
	if total(dealercard)>21
		puts "You win."
	else
		if total(dealercard)>total(mycard)
			puts "Dealer win."
		else
			puts "You win."
		end
	end
end


def show_condition(dealercard,mycard)
	dealertotal=total(dealercard)
	mytotal=total(mycard)
	puts "Dealer Card: #{dealercard}. Total number is #{dealertotal}."
	puts "Your Card: #{mycard}. Total number is #{mytotal}."  
end


def get_condition
  stand_hit=""
  puts 'Do you want to stand(enter 1) or hit(enter 2)?'
	stand_hit=gets.chomp
  stand_hit
end



play_again=true
welcome
while play_again
  card=[]
  mycard=[]
  dealercard=[]
  mycard,dealercard,card=init
  show_condition(dealercard,mycard)
  stand_hit=get_condition
  while total(mycard)<21
    if stand_hit=='1'
  	  dealer_hit(dealercard,mycard,card)
      break
    else	 
      mycard<<card.pop
  	  show_condition(dealercard,mycard)
  	  stand_hit=get_condition
    end
  end

  
  if total(mycard)==21
  	puts "You win."
  elsif total(mycard)>21
    puts "You loss."
  end


  puts "Do you want to play again? y or n?"
  agian=gets.chomp.downcase
  if agian=="n"
    play_again=false
  end
end

puts "Thanks!"







