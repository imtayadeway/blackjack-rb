require "spec_helper"

RSpec.describe Blackjack::Outcome do
  specify "the player has won if they are not bust and the dealer is bust" do
    dealer = double(:bust? => true)
    player = double(:bust? => false)
    bet = double

    outcome = Blackjack::Outcome.new(dealer, player, bet)

    expect(outcome.player_won?).to be(true)
  end

  specify "the player has bust and therefore has lost" do
    dealer = double
    player = double(:bust? => true)
    bet = double

    outcome = Blackjack::Outcome.new(dealer, player, bet)

    expect(outcome.player_won?).to be(false)
  end
end
