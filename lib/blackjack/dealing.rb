module Blackjack
  module Dealing
    def deal(player, &block)
      2.times { hit(player, &block) }
    end

    def hit(player, &block)
      player.pick_up_card(block.call)
    end
  end
end
