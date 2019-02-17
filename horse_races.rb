require "pry"
class HorseRaces

    def initialize(player)
        @player = player
        @wallet_horses = player.wallet
        @horses = ["Secratariat", "Man o' War", "California Chrome", "Preakness", "Seattle Slew", "Whirlaway"]  
        puts "Welcome to the Horse Races, #{@player.name}!"
        puts "You have #{@wallet_horses} to bet with today"
        puts 
        rand(1) == 0 ? select_horse : random_event
    end

    def random_event
        if rand(1) == 0
            puts "You found $5 on the ground! 💰"
            @wallet_horses += 5
            puts "You have #{@wallet_horses} to bet with"
            puts
        else
            puts "You decide to go to the bar before playing 🍸"
            @wallet_horses -= 5
            puts "You have #{@wallet_horses} to bet with"
            puts
        end
        select_horse
    end

    def select_horse
        puts "Here are the horses in the upcoming race" 
        puts "Input the number of the horse to select one: "
        @horses.each_with_index do |horse, index|
            puts "#{index + 1}) #{horse}"
        end
        choice = gets.to_i
        if choice < 7
            @selected_horse = @horses[choice - 1]
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
            @odds = 3
        when 2 
            @odds = 2
        when 3
            @odds = 1
        else
            puts "Invalid choice"
            betting
        end
        if @wallet_horses  > 0
            puts "Now, how much do you want to bet? Our minimum bet is $1"
            bet = gets.to_i
            race(bet)
        else
            puts "You don't have enough money to bet"
            return_to_casino
        end
    end

    def race(bet)
        @winning_horse = @horses.sample
        puts "And they're off!"
        horse_pic =  "🏇"

        6.times do |x|
            puts horse_pic.prepend("=")
            sleep(0.5)
        end
        if @selected_horse == @winning_horse
            @wallet_horses += bet + bet * @odds
            puts "You won!"
            puts "You have #{@wallet_horses} left to bet with"
            menu_two
        else
            @wallet_horses -= bet
            puts "You lose!"
            puts "You have $#{@wallet_horses} left to bet with"
            menu_two
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
        @player.wallet = @wallet_horses
    end

end




