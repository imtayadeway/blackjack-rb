module Blackjack
  class Round
    attr_reader :dealer, :player

    def initialize(dealer, player, bet, output = $stdout)
      @dealer = dealer
      @player = player
      @bet = bet
      @output = output
    end

    def go
      participants.each { |participant| dealer.deal(participant) }
      output.puts dealer.obscured_status
      output.puts player.status

      Blackjack::PlayerTurn.new(dealer, player, output).go
      output.puts "\n"
      Blackjack::DealerTurn.new(dealer, output).go

      outcome = Blackjack::Outcome.new(dealer, player, bet)
      outcome.collect_winnings
      output.puts outcome.to_s

      participants.each { |participant| dealer.collect(participant) }
      output.puts "\n"
    end

    private

    attr_reader :output, :bet

    def participants
      [player, dealer]
    end
  end
end
