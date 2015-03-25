require "spec_helper"

describe Blackjack::Player do
  specify "when she picks up a card she should have one card" do
    player = described_class.new
    card = double('card')
    expect { player.pick_up_card(card) }.to change { player.hand.count }.by(1)
  end

  describe "#bust?" do
    it "returns true if score > 21" do
      player = new_player_with_hand(:jack, :queen, 2)
      expect(player).to be_bust
    end

    it "returns false if score == 21" do
      player = new_player_with_hand(:ace, :jack)
      expect(player).not_to be_bust
    end

    it "returns false if score is < 21" do
      player = new_player_with_hand(:jack, :queen)
      expect(player).not_to be_bust
    end
  end

  describe "#score" do
    it "returns 0 with no cards" do
      player = described_class.new
      expect(player.score).to be_zero
    end

    it "returns 11 with one ace" do
      player = new_player_with_hand(:ace)
      expect(player.score).to eq(11)
    end

    it "returns 2 with one two" do
      player = new_player_with_hand(2)
      expect(player.score).to eq(2)
    end

    it "returns 5 with a 2 and a 3" do
      player = new_player_with_hand(2, 3)
      expect(player.score).to eq(5)
    end

    it "returns 21 with an ace and a 10" do
      player = new_player_with_hand(:ace, 10)
      expect(player.score).to eq(21)
    end

    it "returns 21 with an ace and a jack" do
      player = new_player_with_hand(:ace, :jack)
      expect(player.score).to eq(21)
    end

    it "returns 21 with an ace and a queen" do
      player = new_player_with_hand(:ace, :queen)
      expect(player.score).to eq(21)
    end

    it "returns 21 with an ace and a king" do
      player = new_player_with_hand(:ace, :king)
      expect(player.score).to eq(21)
    end

    it "returns 12 with two aces" do
      player = new_player_with_hand(:ace, :ace)
      expect(player.score).to eq(12)
    end

    it "returns 12 with an ace, a 9 and a 2" do
      player = new_player_with_hand(:ace, 9, 2)
      expect(player.score).to eq(12)
    end
  end

  def new_player_with_hand(*ranks)
    cards = ranks.map do |rank|
      Blackjack::Card.build(rank, Blackjack::Card::SUITS.sample)
    end

    described_class.new(cards)
  end
end
