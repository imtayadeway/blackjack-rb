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
        participants.each { |participant| deal(participant) }

        loop do
          puts dealer.status
          puts player.status
          print "hit me: [y/n]: "

          case gets.chomp
          when "y" then hit(player)
          end

          break if player.bust?
        end

        participants.each do |player|
          dealer.collect(player.hand)
        end

        break
      end
    end

    def participants
      [player, dealer]
    end

    def deal(player)
      2.times { player.pick_up_card(deck.deal) }
    end

    def hit(player)
      player.pick_up_card(deck.deal)
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
