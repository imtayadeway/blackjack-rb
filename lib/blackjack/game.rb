module Blackjack
  class Game
    attr_reader :deck, :dealer, :players

    def initialize
      @deck = Deck.standard
      @dealer = Dealer.new
      @players = [Player.new]
    end

    def start
      puts "shufflng the deck..."
      deck.shuffle

      loop do
        puts "dealing the cards..."
        participants.each { |participant| deal(participant) }

        players.each do |player|
          loop do
            hit(player)
            puts player.hand.score
            break if deck.cards.empty?
            break if player.bust?
          end
        end

        participants.each do |player|
          dealer.collect(player.hand)
        end

        break
      end
    end

    def participants
      players + [dealer]
    end

    def deal(player)
      2.times { player.pick_up_card(deck.pick) }
    end

    def hit(player)
      card = deck.pick
      player.pick_up_card(card)
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
