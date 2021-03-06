# frozen_string_literal: true

describe Forbidium do
  let(:symbol_hash) { { hi: 'hi', hello: 'hello' } }
  let(:string_hash) { { 'hi' => 'hi', 'hello' => 'hello' } }

  context 'when included' do
    it 'adds #allow and #allow! instance methods' do
      class AllowTestObject; end

      expect(AllowTestObject.new).not_to respond_to :allow
      expect(AllowTestObject.new).not_to respond_to :allow!

      AllowTestObject.class_eval { include Forbidium }

      expect(AllowTestObject.new).to respond_to :allow
      expect(AllowTestObject.new).to respond_to :allow!
    end
  end

  context '#allow' do
    it 'only allows the named keys if they have the specified value' do
      expect(symbol_hash.allow(hi: 'hi', hello: 'goodbye')).to eq(hi: 'hi')
      expect(string_hash.allow(hi: 'hi', hello: 'goodbye')).to_not eq('hi' => 'hi')

      expect(symbol_hash.allow('hi' => 'hi', 'hello' => 'goodbye')).to_not eq(hi: 'hi')
      expect(string_hash.allow('hi' => 'hi', 'hello' => 'goodbye')).to eq('hi' => 'hi')
    end

    it 'works with arrays of values' do
      expect(
        symbol_hash.allow(hi: %w[hi hey], hello: %w[bye goodbye])
      ).to eq(hi: 'hi')
      expect(
        string_hash.allow(hi: %w[hi hey], hello: %w[bye goodbye])
      ).to_not eq('hi' => 'hi')

      expect(
        symbol_hash.allow('hi' => %w[hi hey], 'hello' => %w[bye goodbye])
      ).to_not eq(hi: 'hi')
      expect(
        string_hash.allow('hi' => %w[hi hey], 'hello' => %w[bye goodbye])
      ).to eq('hi' => 'hi')
    end

    it 'does not mutate the original object' do
      expect(symbol_hash.allow(hi: 'hi', hello: 'goodbye')).to eq(hi: 'hi')
      expect(symbol_hash).to eq(hi: 'hi', hello: 'hello')
    end
  end

  context '#allow!' do
    it 'only allows the named keys if they have the specified value' do
      expect(symbol_hash.allow!(hi: 'hi', hello: 'goodbye')).to eq(hi: 'hi')
      expect(string_hash.allow!('hi' => 'hi', 'hello' => 'goodbye')).to eq('hi' => 'hi')
    end

    it 'works with arrays of values' do
      expect(
        symbol_hash.allow!(hi: %w[hi hey], hello: %w[bye goodbye])
      ).to eq(hi: 'hi')
      expect(
        string_hash.allow!('hi' => %w[hi hey], 'hello' => %w[bye goodbye])
      ).to eq('hi' => 'hi')
    end

    it 'does mutate the original object' do
      expect(symbol_hash.allow!(hi: 'hi', hello: 'goodbye')).to eq(hi: 'hi')
      expect(symbol_hash).to eq(hi: 'hi')
    end
  end
end
