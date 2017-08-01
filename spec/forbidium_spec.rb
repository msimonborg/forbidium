describe Forbidium do
  it 'includes Forbidium::Allow and Forbidium::Forbid when included' do
    class ForbidiumTestObject; end

    expect(ForbidiumTestObject.include?(Forbidium::Allow)).not_to be true
    expect(ForbidiumTestObject.include?(Forbidium::Forbid)).not_to be true

    ForbidiumTestObject.class_eval { include Forbidium }

    expect(ForbidiumTestObject.include?(Forbidium::Allow)).to be true
    expect(ForbidiumTestObject.include?(Forbidium::Forbid)).to be true
  end

  it 'is included in Hash when required' do
    expect(Hash.include?(Forbidium)).to be true
  end
end
