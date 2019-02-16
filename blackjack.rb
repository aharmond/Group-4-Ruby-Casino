
class BlackJack
  attr_accessor :start

  def initialize
   # pullwallet
    start
  end

  def pullwallet
   # @blackjackwallet = @wallet
  end

  def game
    dealerrunning = (rand(1..10))
    playerrunning = (rand(1..10))
    puts "The dealer flipped this card"
    puts dealerrunning
    puts "You flipped this card"
    puts playerrunning
    if 
      dealerrunning < playerrunning
      puts "YOU WIN!"
    #  @blackjackwallet = @blackjackwallet + @bet

    else
      puts "YOU LOSE"
    #  @blackjackwallet = @blackjackwallet - @bet
    end
    puts "THank you for playing"
  end

  def start
    puts "Welcome to Black Jack!"
    puts "Get ready to lose all your money"
    puts @wallet
    puts "How much would you like to bet? (or bet 0 to return to games menu)"
  
    @bet = gets.to_i
    game
  end
end
   # if 
   #   @bet == 0
   #   exit
   # else
   #   game
   # end
  


  # puts "Do you want to add another card (type y or n)"
 # choice = gets.strip.downcase
 # if 
 #   choice == "y"
 #    @dealerrunning.push(rand(1..10))
 #    puts sum(@dealerrunning)
 #    @playerrunning.push(rand(1..10))
 #    puts sum(@playerrunning)
 # else
 #   exit


  #def @playercardtotal
  #end

  #def dealer
    #puts "The dealer puts a #{} on the table"
    #if 
     # card > 21
     # playerwin
    #else
      

  #end

  #def playerwin
  #end

  #def playerlose
  #end


  #case newtotal
  #when == 21
  #  playerlose
  #when > 21
  #  playerwin
  #when 


 # def @dealercardtotal
   # total = rand(1..10)
   # newtotal = total + rand(1..10)
  #  case newtotal
 #   when == 21
#      playerlose
    #when > 21
   #   playerwin
  #  when 

 # end
#end
#@dealerrunning = []
#@playerrunning = []

#scoring
    #if 
    #  @dealerrunning == true
    #  puts "playerlose"
    #else
    #end
    #if
    #  @dealerrunning = true
    #  puts "playerwin"
    #else
    #end