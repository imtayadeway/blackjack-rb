module Blackjack
  class Hand
    attr_reader :cards

    def initialize(cards = [])
      @cards = cards
    end

    def bust?
      score > 21
    end

    def score
      cards.sort.inject(0) { |sum, card| card.cumulative_score_for(sum) }
    end

    def add_card(card)
      cards << card
    end
  end
end
