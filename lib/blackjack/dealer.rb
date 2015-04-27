module Blackjack
  class Dealer < Player
    include Dealing

    def play(output = $stdout)
      loop do
        output.puts status
        sleep(1)
        break if score > 17
        hit(self)
      end
    end

    def obscured_status
      "#{ name } (?): [#{ hand.first }, xxxx]"
    end
  end
end
