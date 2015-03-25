module Blackjack
  class Player
    attr_reader :hand

    def initialize
      @hand = Hand.new
    end

    def bust?
      hand.bust?
    end

    def pick_up_card(card)
      hand.add_card(card)
    end

    def cards
      hand.cards
    end
  end
end
