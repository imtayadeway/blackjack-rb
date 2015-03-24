module Blackjack
  class Hand
    def initialize(cards = [])
      @cards = cards
    end

    def bust?
      true
    end

    def score
      @cards.sort.inject(0) do |sum, card|
        sum + score_for(sum, card)
      end
    end

    def score_for(sum, card)
      case card.rank
      when Integer then card.rank
      when :ace
        if sum + 11 > 21
          1
        else
          11
        end
      else
        10
      end
    end
  end
end
