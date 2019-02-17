class BlackJack
  attr_accessor :player
  def initialize(player)
    @player = player
    @bjmoney = @player.wallet
    bet
  end

  def bet
    puts "Welcome to BlackJack #{@player.name}"
    puts "You have #{@bjmoney} dollars"
    puts "How much would you like to bet? (or bet 0 to return to games menu)"
    @bet = gets.to_i
    if 
      @bet == 0
      back_tomenu
    elsif
      @bet > @bjmoney
      puts "You don't have enough money"
      puts "---"
      bet
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
    if finalnumberd < finalnumber
      finalnumberd = finalnumberd + rand(1..11)
      puts "The dealer turned over 1 more card and totaled #{finalnumberd}"
    else
    end
    case
    when finalnumber == finalnumberd
      puts "Tie"
      bet
    when finalnumber == 21
      puts "YOU WIN!!!"
        @bjmoney = @bjmoney + @bet
        bet
      when finalnumber > 21
        puts "YOU LOSE!"
        @bjmoney = @bjmoney - @bet
        bet
      when finalnumberd > 21
        puts "YOU WIN!!!"
        @bjmoney = @bjmoney + @bet
        bet
      when finalnumberd > finalnumber
        puts "YOU LOSE!"
        @bjmoney = @bjmoney - @bet
        bet
      when finalnumber > finalnumberd
        puts "YOU WIN!!!"
        @bjmoney = @bjmoney + @bet
        bet
      else
      end
    end

    def hit
      @playerrunning = @playerrunning + rand(1..11)
      if 
        @dealerrunning < 14
        @dealerrunning = @dealerrunning + rand(1..11)
      else
        @dealerrunning = @dealerrunning
      end
      game
    end
    
    def dealerhit
      if finalnumberd < finalnumber
        finalnumberd = finalnumberd + rand(1..11)
        puts "The dealer turned over 1 more card"
        puts finalnumberd
        dealerhit
      else
      end
    end

    def back_tomenu
      puts "Are you sure you want to leave BlackJack?"
      puts "1) Yes"
      puts "2) No"
      choice = gets.to_i
      if choice == 1
        puts "Thank you for playing"
        sleep(1)
      elsif choice == 2
        puts "---"
        bet
      else
        puts "Invalid selection"
        back_tomenu
      end

    end

  
end
