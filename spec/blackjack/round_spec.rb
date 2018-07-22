require "spec_helper"

RSpec.describe Blackjack::Round do
  it "will skip the dealer if the player has bust" do
    dealer = spy("dealer")
    player = spy("player", :bust? => true)
    bet = double
    output = StringIO.new
    player_turn = spy
    dealer_turn = spy
    stub_const("Blackjack::PlayerTurn", player_turn)
    stub_const("Blackjack::DealerTurn", dealer_turn)

    expect(dealer_turn).not_to receive(:new)

    Blackjack::Round.new(dealer, player, bet, output).go
  end
end
