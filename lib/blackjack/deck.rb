module Blackjack
  class Deck
    def self.standard
      StandardDeck.new
    end

    def initialize(cards = [])
      @cards = cards
    end

    def count
      cards.count
    end

    def pick
      cards.pop
    end

    private

    attr_reader :cards

    class StandardDeck < Deck
      def count
        52
      end
    end

  end
end
