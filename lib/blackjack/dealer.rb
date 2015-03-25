module Blackjack
  class Dealer < Player
    include Dealing

    def play(deck)
      loop do
        puts status
        sleep(1)
        break if score > 17
        hit(self) { deck.deal }
      end
    end

    def obscured_status
      "#{ name } (?): [#{ hand.first }, xxxx]"
    end
  end
end
