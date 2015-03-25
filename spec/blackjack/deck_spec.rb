require "spec_helper"

describe Blackjack::Deck do
  describe ".standard" do
    it "has 52 cards" do
      deck = described_class.standard
      expect(deck.count).to eq(52)
    end

    it "has the ace of spades" do
      deck = described_class.standard
      expect(deck.cards).to include(Blackjack::Card.build(:ace, :spades))
    end

    it "has the queen of hearts" do
      deck = described_class.standard
      expect(deck.cards).to include(Blackjack::Card.build(:queen, :hearts))
    end
  end

  describe "#pick" do
    it "returns a card from the top" do
      bottom_card = double("top card")
      top_card = double("bottom card")
      deck = described_class.new([bottom_card, top_card])

      expect(deck.pick).to eq(top_card)
    end

    it "decrements the count by 1" do
      a_card = double("a card")
      another_card = double("another card")
      deck = described_class.new([a_card, another_card])
      expect { deck.pick }.to change { deck.count }.by(-1)
    end
  end
end
