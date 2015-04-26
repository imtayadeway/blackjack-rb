module Blackjack
  class Game
    attr_reader :dealer, :player

    def initialize
      @dealer = Dealer.new("The Dealer")
      @player = Player.new("Player 1")
    end

    def start
      puts "\n"
      puts "~~~***$$$ Blackjack-Ruby $$$***~~~\n\n"

      dealer.shuffle

      loop do
        participants.each { |participant| dealer.deal(participant) }
        puts dealer.obscured_status
        puts player.status

        loop do
          puts "\n"
          print "hit or stand? [h/s]: "

          case gets.chomp
          when "h" then dealer.hit(player)
          when "s" then break
          end

          puts player.status
          break if player.bust? || player.blackjack?
        end

        puts "\n"
        dealer.play
        puts "\n"
        puts outcome
        participants.each { |player| dealer.collect(player) }
        puts "\n"
      end
    end

    def participants
      [player, dealer]
    end

    def outcome
      if player.bust? || !dealer.bust? && player.score < dealer.score
        "You lost!"
      else
        "You won!"
      end <<
        "\n#{ player.name }: (#{ player.score }) | " \
        "#{ dealer.name }: (#{ dealer.score })"
    end
  end
end
