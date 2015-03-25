require "spec_helper"

describe Blackjack::Hand do
  describe "#bust?" do
    it "returns true if score > 21" do
      hand = new_hand_with_cards(:jack, :queen, 2)
      expect(hand).to be_bust
    end

    it "returns false if score == 21" do
      hand = new_hand_with_cards(:ace, :jack)
      expect(hand).not_to be_bust
    end

    it "returns false if score is < 21" do
      hand = new_hand_with_cards(:jack, :queen)
      expect(hand).not_to be_bust
    end
  end

  describe "#score" do
    it "returns 0 with no cards" do
      hand = described_class.new
      expect(hand.score).to be_zero
    end

    it "returns 11 with one ace" do
      hand = new_hand_with_cards(:ace)
      expect(hand.score).to eq(11)
    end

    it "returns 2 with one two" do
      hand = new_hand_with_cards(2)
      expect(hand.score).to eq(2)
    end

    it "returns 5 with a 2 and a 3" do
      hand = new_hand_with_cards(2, 3)
      expect(hand.score).to eq(5)
    end

    it "returns 21 with an ace and a 10" do
      hand = new_hand_with_cards(:ace, 10)
      expect(hand.score).to eq(21)
    end

    it "returns 21 with an ace and a jack" do
      hand = new_hand_with_cards(:ace, :jack)
      expect(hand.score).to eq(21)
    end

    it "returns 21 with an ace and a queen" do
      hand = new_hand_with_cards(:ace, :queen)
      expect(hand.score).to eq(21)
    end

    it "returns 21 with an ace and a king" do
      hand = new_hand_with_cards(:ace, :king)
      expect(hand.score).to eq(21)
    end

    it "returns 12 with two aces" do
      hand = new_hand_with_cards(:ace, :ace)
      expect(hand.score).to eq(12)
    end

    it "returns 12 with an ace, a 9 and a 2" do
      hand = new_hand_with_cards(:ace, 9, 2)
      expect(hand.score).to eq(12)
    end
  end

  def new_hand_with_cards(*ranks)
    cards = ranks.map do |rank|
      Blackjack::Card.build(rank, Blackjack::Card::SUITS.sample)
    end

    described_class.new(cards)
  end
end
