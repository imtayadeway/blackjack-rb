module Blackjack
  class Deck
    def self.standard
      Deck.new(Card.all)
    end

    attr_reader :cards

    def initialize(cards = [])
      @cards = cards
    end

    def deal
      cards.pop
    end

    def add_card(card)
      cards.unshift(card)
    end

    def shuffle
      cards.shuffle!
    end
  end
end
