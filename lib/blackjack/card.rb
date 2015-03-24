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
        self.class == other.class && [rank, suit] == [other.rank, other.suit]
    end

    def <=>(other)
      value <=> other.value
    end

    def value
      case rank
      when Integer then rank
      when :ace then 11
      when :jack, :queen, :king then 10
      end
    end
  end
end
