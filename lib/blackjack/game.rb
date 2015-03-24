module Blackjack
  class Game
    attr_reader :deck, :dealer, :players

    def initialize
      @deck = Deck.standard
      @dealer = Dealer.new
      @players = [Player.new]
    end

    def start
      deck.shuffle

      loop do
        dealer.deal(deck, players)

        participants.each do |player|
          loop do
            hit(player)
            break if player.bust?
          end
        end

        participants.each do |player|
          dealer.collect(player.hand)
        end
      end
    end

    def participants
      players + [dealer]
    end

    def hit(player)
      #
    end

    def stand(player)
      #
    end

    def double_down(player)
      #
    end

    def split(player)
      #
    end
  end
end
