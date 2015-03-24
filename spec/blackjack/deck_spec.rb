require "spec_helper"

describe Blackjack::Deck do
  specify "a standard deck has 52 cards" do
    deck = described_class.standard
    expect(deck.count).to eq(52)
  end

  describe "#pick" do
    it "returns a card from the top" do
      bottom_card = instance_double(Blackjack::Card)
      top_card = instance_double(Blackjack::Card)
      deck = described_class.new([bottom_card, top_card])

      expect(deck.pick).to eq(top_card)
    end

    it "decrements the count by 1" do
      a_card = instance_double(Blackjack::Card)
      another_card = instance_double(Blackjack::Card)
      deck = described_class.new([a_card, another_card])
      expect { deck.pick }.to change { deck.count }.by(-1)
    end
  end
end
