module Blackjack
  class Outcome
    attr_reader :dealer, :player, :bet

    def initialize(dealer, player, bet)
      @dealer = dealer
      @player = player
      @bet = bet
    end

    def to_s
      if player_won?
        "\nYou won!"
      else
        "\nYou lost!"
      end <<
        "\nYou now have $#{player.chips}" <<
        "\n#{ player.name }: (#{ player.score }) | " \
        "#{ dealer.name }: (#{ dealer.score })"
    end

    def collect_winnings
      if player_won?
        player.chips += bet
      else
        player.chips -= bet
      end
    end

    def player_won?
      !player.bust? && dealer.bust? || player.score > dealer.score
    end
  end
end
