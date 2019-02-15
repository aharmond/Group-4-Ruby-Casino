class HorseRaces
    def initialize(wallet)
        @wallet = wallet
        @winnings = 0
        @horses = ["Secratariat", "Man o' War", "California Chrome", "Preakness", "Seattle Slew", "Whirlaway"]  
        puts "Welcome to the Horse Races!"
        puts "Here are the horses in the upcoming race"     
        game
    end
    def game
        puts "Input the number of the horse to select one: "
        @horses.each_with_index do |horse, index|
            puts "#{index + 1}) #{horse}"
        end
        selected_horse = @horses[gets.to_i - 1]
        winning_horse = @horses.sample
        puts "Would you like to bet that #{selected_horse} will:"
        puts "1) Win (3 : 1 odds)"
        puts "2) Place (2 : 1 odds)" 
        puts "3) Show (1 : 1 odds)"
        choice = gets.to_i
        case choice 
        when 1
            odds = 3
        when 2 
            odds = 2
        when 1
            odds = 1
        end
        puts "Now, how much do you want to bet? Our minimum bet is $1"
        bet = gets.to_i
        if selected_horse == winning_horse
            @winnings += bet + bet * odds
            puts "You won!"
            puts "You current winnings are $#{@winnings}"
            menu_two
        else
            @winnings -= bet + bet * odds
            puts "You lost $#{@winnings.abs}"
            menu_two
        end
    end

    def menu_two 
        puts "Would you like to"
        puts "1) Play again"
        puts "2) Return to casino"
        choice = gets.to_i
        case choice
        when 1
            game
        when 2
            return_to_casino
        end
    end

    def return_to_casino
        @wallet = @wallet + @winnings
        if @wallet > 0
            puts "You have $#{@wallet} in your wallet"
            return @wallet
        else
            puts "You owe the casino $#{@wallet.abs}"
            return @wallet
        end
    end
end

game = HorseRaces.new(200)

