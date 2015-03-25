module Blackjack
  class Player
    attr_reader :name, :hand

    def initialize(name, hand = [])
      @name = name
      @hand = hand
    end

    def bust?
      score > 21
    end

    def blackjack?
      score == 21
    end

    def pick_up_card(card)
      hand << card
    end

    def return_cards
      loop do
        break if hand.empty?
        yield hand.shift
      end
    end

    def score
      hand.sort.inject(0) { |sum, card| card.cumulative_score_for(sum) }
    end

    def status
      "#{ name } (#{ score }): #{ hand.map(&:to_s).inspect }"
    end
  end
end
