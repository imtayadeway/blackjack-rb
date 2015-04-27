module Blackjack
  class DealerTurn
    attr_reader :dealer, :output

    def initialize(dealer, output = $stdout)
      @dealer = dealer
      @output = output
    end

    def go
      loop do
        output.puts dealer.status
        sleep(1)
        break if dealer.score > 17
        dealer.hit(dealer)
      end
    end
  end
end
