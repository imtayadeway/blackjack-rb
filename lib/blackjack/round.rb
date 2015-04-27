module Blackjack
  class Round
    attr_reader :dealer, :player

    def initialize(dealer, player, bet, output = $stdout)
      @dealer = dealer
      @player = player
      @bet = bet
      @output = output
    end

    def go
      participants.each { |participant| dealer.deal(participant) }
      output.puts dealer.obscured_status
      output.puts player.status

      Blackjack::PlayerTurn.new(dealer, player, output).go
      output.puts "\n"
      Blackjack::DealerTurn.new(dealer, output).go

      collect_winnings

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
      if player_won?
        "You won!"
      else
        "You lost!"
      end <<
        "\nYou now have $#{player.chips}" <<
        "\n#{ player.name }: (#{ player.score }) | " \
        "#{ dealer.name }: (#{ dealer.score })"
    end

    def player_won?
      !player.bust? && dealer.bust? || player.score > dealer.score
    end

    def collect_winnings
      if player_won?
        player.chips += bet
      else
        player.chips -= bet
      end
    end
  end
end
