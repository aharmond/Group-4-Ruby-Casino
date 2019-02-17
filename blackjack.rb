class BlackJack
  attr_accessor :@player
  def initialize(@player.wallet)
    @bjmoney = @player.wallet
    bet
  end

  def bet
    puts "Welcome to BlackJack #{@player.net}"
    puts "You have #{@bjmoney} dollars"
    puts "How much would you like to bet? (or bet 0 to return to games menu)"
    @bet = gets.to_i
    case @bet
    when "0"
      exit
    when
      @bet > @bjmoney
      puts "You don't have enough money"
    else 
      game_start
    end
  end

  def game_start
    @dealerrunning = rand(1..11)
    @playerrunning = rand(1..11)
    game
  end
  
  def game
    puts "The dealer's total of flipped cards is:"
    puts @dealerrunning
    puts "Your total of flipped cards is:"
    puts @playerrunning
    puts "Would you like to add a card (y/n)?"
    newcard = gets.strip.downcase
    if 
      newcard == "y"
      hit
    else
      result
    end
  end

   def result
    finalnumber = @playerrunning
    finalnumberd = @dealerrunning
    case
    when finalnumberd > 21
      puts "YOU WIN!!!"
        @bjmoney = @bjmoney + @bet
        bet
      when finalnumber > 21
        puts "YOU LOSE!"
        @bjmoney = @bjmoney - @bet
        bet
      when finalnumber == 21, finalnumber > finalnumberd
        puts "YOU WIN!!!"
        @bjmoney = @bjmoney + @bet
        bet
      when finalnumber < finalnumberd
        puts "YOU LOSE!"
        @bjmoney = @bjmoney - @bet
        bet
      when finalnumber > finalnumberd
        puts "YOU WIN!!!"
        @bjmoney = @bjmoney + @bet
        bet
      else
      end
      bet
    end

    def hit
      @dealerrunning = @dealerrunning + rand(1..11)
      @playerrunning = @playerrunning + rand(1..11)
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