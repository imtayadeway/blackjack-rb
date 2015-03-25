module Blackjack
  module Card
    RANKS = [:ace, *(2..10), :jack, :queen, :king].freeze
    SUITS = [:clubs, :diamonds, :hearts, :spades].freeze

    def self.all
      RANKS.product(SUITS).map { |rank, suit| build(rank, suit) }
    end

    def self.build(rank, suit)
      case rank
      when Integer
        Numbered.new(rank, suit)
      when :ace
        Ace.new(rank, suit)
      else
        Face.new(rank, suit)
      end
    end
  end
end

require "blackjack/card/base"
require "blackjack/card/numbered"
require "blackjack/card/face"
require "blackjack/card/ace"
