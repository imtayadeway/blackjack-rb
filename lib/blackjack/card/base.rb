module Blackjack
  module Card
    class Base
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
        fail NotImplementedError
      end

      def cumulative_score_for(sum)
        sum + value
      end
    end
  end
end
