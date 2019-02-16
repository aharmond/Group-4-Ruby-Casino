require "pry"
class HorseRaces

    def initialize(player)
        @player = player
        @wallet_horses = player.wallet
        @winnings = 0
        # pass wallet from Casino.rb to get starting value for @wallet_horses
        @horses = ["Secratariat", "Man o' War", "California Chrome", "Preakness", "Seattle Slew", "Whirlaway"]  
        puts "Welcome to the Horse Races!"
        puts "Here are the horses in the upcoming race"   
        select_horse
    end

    def select_horse
        puts "Input the number of the horse to select one: "
        @horses.each_with_index do |horse, index|
            puts "#{index + 1}) #{horse}"
        end
        choice = gets.to_i
        # error handling
        if choice < 7
            @selected_horse = @horses[choice - 1]
            @winning_horse = @horses.sample
            # ramdomly select from horses array
            betting
        else 
            puts "Invalid Choice"
            select_horse
        end
    end

    def betting
        puts "Would you like to bet that #{@selected_horse} will:"
        puts "1) Win (3 : 1 odds)"
        puts "2) Place (2 : 1 odds)" 
        puts "3) Show (1 : 1 odds)"
        choice = gets.to_i
        case choice 
        when 1
            odds = 3
        when 2 
            odds = 2
        when 3
            odds = 1
        else
            # error handling
            puts "Invalid choice"
            betting
        end
        if @wallet_horses - @winnings.abs > 0
            puts "Now, how much do you want to bet? Our minimum bet is $1"
            bet = gets.to_i

            if @selected_horse == @winning_horse
                # win
                @winnings += bet + bet * odds
                puts "You won!"
                puts "You have #{@wallet_horses - @winnings} left to bet with"
                menu_two
            else
                # lose
                @winnings -= bet
                puts "You lose!"
                puts "You lost $#{@winnings.abs} so far"
                puts "You have $#{@wallet_horses - @winnings.abs} left to bet with"
                menu_two
            end
        else
            puts "You don't have enough money to bet"
            return_to_casino
        end
    end

    def menu_two 
            puts "Would you like to"
            puts "1) Play again"
            puts "2) Return to casino"
            choice = gets.strip
            case choice
            when "1"
                select_horse
            when "2"
                return_to_casino
            else
                puts "Invalid Entry"
                menu_two
            end
    end

    def return_to_casino 
        # should return the starting value +/- winnings
        @player.wallet = @wallet_horses + @winnings
        # binding.pry
    end

end

# game = HorseRaces.new(200)

