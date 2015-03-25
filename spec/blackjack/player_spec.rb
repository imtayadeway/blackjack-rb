require "spec_helper"

describe Blackjack::Player do
  specify "when she picks up a card she should have one card" do
    player = described_class.new
    card = double('card')
    expect { player.pick_up_card(card) }.to change { player.cards.count }.by(1)
  end
end
