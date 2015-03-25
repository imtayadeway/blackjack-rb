module Blackjack
  module Card
    class Numbered < Base
      def value
        rank
      end
    end
  end
end
