require "pry"

class Dice
  attr_accessor :player

  def initialize(player)
    @player = player
    @wallet_dice = player.wallet
    dice_table
  end

  def dice_table
    puts "You have $#{@wallet_dice}."
    puts "1) Bet"
    puts "2) Cashout"
    selection = gets.to_i
    if selection == 1
      dice_bet
    elsif selection == 2
      cash_out
    else
      puts "Invalid selection."
      puts ""
      dice_table
    end
  end

  def dice_bet
    puts `clear`
    puts "You have $#{@wallet_dice} to bet."
    puts "How much would you like to bet?"
    @bet = gets.to_i
    if @bet == 0
      dice_bet
    elsif @bet > @wallet_dice
      puts "You don't have that much money!"
      puts ""
      dice_table
    else
      @wallet_dice = @wallet_dice - @bet
      dice_roll
    end
  end

  def dice_game
    puts "Other players rolled #{@opponent_dice}"
    puts "You rolled #{@playerdice}"
    puts ""
    sleep (1)
    if @playerdice > @opponent_dice.max
      puts "You won!"
      @wallet_dice = @wallet_dice + (@bet * 4)
      sleep (1)
      puts ""
      dice_table
    elsif @playerdice < @opponent_dice.max
      puts "You lost."
      sleep (1)
      puts ""
      dice_table
    else @playerdice = @opponent_dice.max 
      reroll
    end
  end

  def reroll
    puts ""
    puts "Reroll between the two highest!"
    playerdice = 1 + rand(6)
    opponentdice = 1 + rand(6)
    puts "Your opponent rolled #{opponentdice}"
    puts "You rolled #{playerdice}"
    sleep (1)
    if playerdice > opponentdice
      puts "You won!"
      @wallet_dice = @wallet_dice + (@bet * 4)

      sleep (1)
      puts ""
      dice_table
    elsif playerdice < opponentdice
      puts "You lost."
      sleep (1)
      puts ""
      dice_table
    else playerdice = opponentdice
      reroll
    end
  end

  def cash_out
    player.wallet = @wallet_dice
  end

  def dice_roll
    @opponent_dice = [
      @dice1 = 1 + rand(6),
      @dice2 = 1 + rand(6),
      @dice3 = 1 + rand(6)
  ]

    @playerdice = 1 + rand(6)

    dice_game
  end
end