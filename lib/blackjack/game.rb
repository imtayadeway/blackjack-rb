module Blackjack
  class Game
    attr_reader :dealer, :player

    def initialize
      @dealer = Dealer.new("The Dealer")
      @player = Player.new("Player 1")
    end

    def start
      dealer.shuffle

      loop do
        participants.each { |participant| dealer.deal(participant) }

        loop do
          puts dealer.obscured_status
          puts player.status
          print "hit or stand? [h/s]: "

          case gets.chomp
          when "h" then dealer.hit(player)
          when "s" then break
          end

          break if player.bust? || player.blackjack?
        end

        dealer.play
        puts outcome
        participants.each { |player| dealer.collect(player) }
      end
    end

    def participants
      [player, dealer]
    end

    def outcome
      "#{ player.name }: (#{ player.score }) | " \
      "#{ dealer.name }: (#{ dealer.score }): " <<
        if player.bust? || !dealer.bust? && player.score < dealer.score
          "You lost!"
        else
          "You won!"
        end
    end
  end
end
