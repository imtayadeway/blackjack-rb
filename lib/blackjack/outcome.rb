module Blackjack
  class Outcome
    attr_reader :round, :dealer, :player

    def initialize(round, dealer, player)
      @round = round
      @dealer = dealer
      @player = player
    end

    def to_s
      if round.player_won?
        "\nYou won!"
      else
        "\nYou lost!"
      end <<
        "\nYou now have $#{player.chips}" <<
        "\n#{ player.name }: (#{ player.score }) | " \
        "#{ dealer.name }: (#{ dealer.score })"
    end
  end
end
