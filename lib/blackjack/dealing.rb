module Blackjack
  module Dealing
    def deal(player, &block)
      2.times { hit(player, &block) }
    end

    def hit(player, &block)
      player.pick_up_card(block.call)
    end

    def collect(player, deck)
      player.return_cards { |card| deck.add_card(card) }
    end
  end
end
