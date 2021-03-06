module Blackjack
  class PlayerTurn
    attr_reader :dealer, :player, :output

    def initialize(dealer, player, output = $stdout)
      @dealer = dealer
      @player = player
      @output = output
    end

    def go
      loop do
        print "\nhit or stand? [h/s]: "

        case gets.chomp
        when "h" then dealer.hit(player)
        when "s" then break
        end

        output.puts player.status
        break if player.bust? || player.blackjack?
      end
    end
  end
end
