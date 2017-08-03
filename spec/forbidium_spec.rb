# frozen_string_literal: true

describe Allowable do
  it 'includes Allowable::Allow and Allowable::Forbid when included' do
    class AllowableTestObject; end

    expect(AllowableTestObject.include?(Allowable)).not_to be true

    AllowableTestObject.class_eval { include Forbidium }

    expect(AllowableTestObject.include?(Allowable)).to be true
  end

  it 'Allowable is included in Hash when required' do
    expect(Hash.include?(Allowable)).to be true
  end
end
