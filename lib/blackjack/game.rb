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
      loop { Blackjack::Round.new(dealer, player).start }
    end
  end
end
