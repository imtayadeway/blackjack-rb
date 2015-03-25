module Blackjack
  module Dealing
    def deck
      @deck ||= Deck.standard
    end

    def deal(player)
      2.times { hit(player) }
    end

    def hit(player)
      player.pick_up_card(deck.deal)
    end

    def collect(player)
      player.return_cards { |card| deck.add_card(card) }
    end

    def shuffle
      deck.shuffle
    end
  end
end
