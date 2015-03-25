module Blackjack
  module Card
    class Ace < Base
      def value
        11
      end

      def low_value
        1
      end

      def cumulative_score_for(sum)
        if super > 21
          sum + low_value
        else
          super
        end
      end
    end
  end
end
