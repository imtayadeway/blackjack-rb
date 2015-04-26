module Blackjack
  class Round
    attr_reader :dealer, :player

    def initialize(dealer, player, output = $stdout)
      @dealer = dealer
      @player = player
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
      dealer.play
      output.puts "\n"
      output.puts outcome
      participants.each { |player| dealer.collect(player) }
      output.puts "\n"
    end

    private

    attr_reader :output

    def participants
      [player, dealer]
    end

    def outcome
      if player_lost?
        "You lost!"
      else
        "You won!"
      end <<
        "\n#{ player.name }: (#{ player.score }) | " \
        "#{ dealer.name }: (#{ dealer.score })"
    end

    def player_lost?
      player.bust? || !dealer.bust? && player.score < dealer.score
    end
  end
end
