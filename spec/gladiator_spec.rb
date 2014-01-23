require 'spec_helper'
require_relative '../lib/gladiator'
require_relative '../lib/arena'

describe Gladiator do
  let(:gladiator) { Gladiator.new("Thor", "Mjollnir") }

  # a gladiator has a name
  it "has a name" do
    expect(gladiator.name).to eq("Thor")
  end

  # a gladiator has a weapon
  it "has a weapon" do
    expect(gladiator.weapon).to eq("Mjollnir")
  end

end

