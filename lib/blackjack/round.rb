module Blackjack
  class Round
    attr_reader :dealer, :player

    def initialize(dealer, player, bet, output = $stdout)
      @dealer = dealer
      @player = player
      @bet = bet
      @output = output
    end

    def start
      participants.each { |participant| dealer.deal(participant) }
      output.puts dealer.obscured_status
      output.puts player.status

      loop do
        output.puts "\n"
        print "hit or stand? [h/s]: "

        case gets.chomp
        when "h" then dealer.hit(player)
        when "s" then break
        end

        output.puts player.status
        break if player.bust? || player.blackjack?
      end

      output.puts "\n"
      dealer.play { |status| puts status }

      if player_lost?
        player.chips -= bet
      else
        player.chips += bet
      end

      output.puts "\n"
      output.puts outcome

      participants.each { |player| dealer.collect(player) }
      output.puts "\n"
    end

    private

    attr_reader :output, :bet

    def participants
      [player, dealer]
    end

    def outcome
      if player_lost?
        "You lost!"
      else
        "You won!"
      end <<
        "\nYou now have $#{player.chips}" <<
        "\n#{ player.name }: (#{ player.score }) | " \
        "#{ dealer.name }: (#{ dealer.score })"
    end

    def player_lost?
      player.bust? || !dealer.bust? && player.score < dealer.score
    end
  end
end
