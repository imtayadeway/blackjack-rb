module Blackjack
  class Game
    attr_reader :deck, :dealer, :player

    def initialize
      @deck = Deck.standard
      @dealer = Dealer.new("The Dealer")
      @player = Player.new("Player 1")
    end

    def start
      puts "shufflng the deck..."
      deck.shuffle

      loop do
        puts "dealing the cards..."

        participants.each do |participant|
          dealer.deal(participant) { deck.deal }
        end

        loop do
          puts dealer.status
          puts player.status
          print "hit, stand or double down? [h/s/d]: "

          case gets.chomp
          when "h" then dealer.hit(player) { deck.deal }
          when "s" then break
          when "d" then double_down
          end

          break if player.bust?
        end

        participants.each do |player|
          dealer.collect(player, deck)
        end
      end
    end

    def participants
      [player, dealer]
    end
  end
end
