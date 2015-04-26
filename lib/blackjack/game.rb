module Blackjack
  class Game
    attr_reader :dealer, :player

    def initialize
      @dealer = Dealer.new("The Dealer")
      @player = Player.new("Player 1")
    end

    def start
      puts "\n~~~***$$$ Blackjack-Ruby $$$***~~~\n\n"
      dealer.shuffle

      loop do
        print "Enter bet: "
        bet = gets.chomp.to_i
        Blackjack::Round.new(dealer, player, bet).start
      end
    end
  end
end
