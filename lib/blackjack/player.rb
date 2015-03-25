module Blackjack
  class Player
    attr_reader :hand

    def initialize(hand = [])
      @hand = hand
    end

    def bust?
      score > 21
    end

    def pick_up_card(card)
      hand << card
    end

    def score
      hand.sort.inject(0) { |sum, card| card.cumulative_score_for(sum) }
    end
  end
end
