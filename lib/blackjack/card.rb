module Blackjack
  class Card
    RANKS = [:ace, *(2..10), :jack, :queen, :king].freeze
    SUITS = [:clubs, :diamonds, :hearts, :spades].freeze

    def self.all
      RANKS.product(SUITS).map { |rank, suit| new(rank, suit) }
    end

    attr_reader :rank, :suit

    def initialize(rank, suit)
      @rank = rank
      @suit = suit
    end

    def ==(other)
      object_id == other.object_id ||
        other.class == self.class && [rank, suit] == [other.rank, other.suit]
    end
  end
end
