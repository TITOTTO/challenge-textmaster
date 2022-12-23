# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/checkout'

RSpec.describe Checkout, :type => :model do

  describe 'initialize' do
    let(:checkout) { described_class.new(2) }
    it 'Start a new instance' do
      expect(checkout).to be_valid
    end
    it {expect(checkout.pricing_rules).to eq 2}
    end
  end
  
end
