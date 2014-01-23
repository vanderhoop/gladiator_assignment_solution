require 'spec_helper'
require_relative '../lib/gladiator'
require_relative '../lib/arena'
require 'pry'

describe Arena do
  let(:arena) { Arena.new("thunderdome") }
  let(:trident) { Gladiator.new("Mad Max", "Trident") }
  let(:spear) { Gladiator.new("Riggs", "Spear") }
  let(:club) { Gladiator.new("William Wallace", "Club") }
  let(:maximus) { Gladiator.new("Maximus", "Sword") }

  # an arena has a name
  it "has a name" do
    expect(arena.name).to_not eq(nil)
  end

  describe "#name" do
    it "always returns a capitalized word" do
      expect(arena.name).to eq("Thunderdome")
    end
  end # describe - Arena.name

  it "can hold gladiators" do
    expect(arena.gladiators).to be_instance_of(Array)
  end

  it "can add gladiators" do
    arena.add_gladiator(trident)
    expect(arena.gladiators).to include(trident)
  end

  context "when the arena is already holding two gladiators" do
    before(:each) do
      arena.add_gladiator(trident)
      arena.add_gladiator(spear)
    end

    it "can't add a third" do
      arena.add_gladiator(club)
      expect(arena.gladiators.size).to eq(2)
    end

  end # context - when the arena is already holding 2 gladiators

  context "when the arena has < 2 gladiators in the ring" do
    it "can't host a fight" do
      response = "You need 2 gladiators in order for a fight to occur"
      arena.add_gladiator(trident)
      expect(arena.fight).to eq(response)
    end
  end # context - when the arena has < 2 gladiators in the ring

  context "when there are two gladiators in the arena" do
    before(:each) do
      arena.add_gladiator(trident)
      arena.add_gladiator(spear)
    end

    it "can host a fight if there are 2 gladiators in the ring" do
      expect(arena.fight).to eq([trident])
    end

    describe "the battle scenarios" do
      before(:each) do
        arena.clear
      end

      context "when a club fighter fights a Trident fighter" do
        it "the club fighter will win" do
          arena.add_gladiator(club)
          arena.add_gladiator(trident)
          expect(arena.fight).to eq([club])
        end
      end # context - when a club fighter fights a Trident fighter

      context "when a spear fighter takes on a club fighter" do
        it "the spear fighter will win" do
          arena.add_gladiator(spear)
          arena.add_gladiator(club)
          expect(arena.fight).to eq([spear])
        end
      end # context - spear vs. club

      context "when maximus fights anyone" do
        it "he wins" do
          arena.add_gladiator(maximus)
          arena.add_gladiator(spear)
          expect(arena.fight).to eq([maximus])
        end
      end

      context "when fighters of the same weapon fight" do
        it "both fighters will die" do
          arena.add_gladiator(spear)
          arena.add_gladiator(spear)
          expect(arena.fight).to eq([])
        end
      end # context - when fighters of the same weapon fight

    end # describe - the battle scenarios

    describe "#remove_gladiator" do
      it "takes the named gladiator out of the arena" do
        arena.remove_gladiator("Mad Max")
        expect(arena.gladiators).to_not include(trident)
      end
    end # describe - remove gladiator

  end # context - when there are two gladiators in the arena

end #describe Arena
