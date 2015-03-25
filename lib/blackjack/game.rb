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
        participants.each do |participant|
          deal(participant)
        end

        players.each do |player|
          loop do
            puts status_for(player)
            print "hit me: [y/n]: "

            case gets.chomp
            when "y" then hit(player)
            end

            break if player.bust?
          end
        end

        participants.each do |player|
          dealer.collect(player.hand)
        end

        break
      end
    end

    def status_for(participant)
      "#{ participant.class } (#{ participant.score }): " \
      "#{ participant.hand.map(&:to_s).inspect }"
    end

    def participants
      players + [dealer]
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
