require 'rails_helper'

RSpec.describe User, type: :model do
  context "positive case" do
    it { expect(1 + 1).to eq(2) }
  end

  context "negative case" do
    it { expect(1 + 1).not_to eq(1) }
  end
end
