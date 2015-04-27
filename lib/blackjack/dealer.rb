module Blackjack
  class Dealer < Player
    include Dealing

    def obscured_status
      "#{ name } (?): [#{ hand.first }, xxxx]"
    end
  end
end
