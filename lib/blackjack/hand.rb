module Blackjack
  class Hand
    def initialize(cards = [])
      @cards = cards
    end

    def bust?
      score > 21
    end

    def score
      @cards.sort.inject(0) { |sum, card| card.cumulative_score_for(sum) }
    end
  end
end
