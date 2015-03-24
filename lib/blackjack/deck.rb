module Blackjack
  class Deck
    def self.standard
      Deck.new(Card.all)
    end

    attr_reader :cards

    def initialize(cards = [])
      @cards = cards
    end

    def count
      cards.count
    end

    def pick
      cards.pop
    end

    def shuffle
      cards.shuffle!
    end
  end
end
