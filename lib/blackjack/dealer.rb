module Blackjack
  class Dealer < Player
    include Dealing

    def play
      loop do
        yield status
        sleep(1)
        break if score > 17
        hit(self)
      end
    end

    def obscured_status
      "#{ name } (?): [#{ hand.first }, xxxx]"
    end
  end
end
