module Blackjack
  class Player
    def bust?
      hand.bust?
    end

    def hand
      Hand.new
    end
  end
end
