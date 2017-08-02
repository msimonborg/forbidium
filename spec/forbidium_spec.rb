# frozen_string_literal: true

describe Forbidium do
  context 'Forbidium::ActionController::Parameters' do
    it 'includes namespaced Allow and Forbid modules when included' do
      class ForbidiumParametersTestObject; end

      expect(
        ForbidiumParametersTestObject.include?(Forbidium::ActionController::Parameters::Allow)
      ).not_to be true
      expect(
        ForbidiumParametersTestObject.include?(Forbidium::ActionController::Parameters::Forbid)
      ).not_to be true

      ForbidiumParametersTestObject.class_eval { include Forbidium::ActionController::Parameters }

      expect(
        ForbidiumParametersTestObject.include?(Forbidium::ActionController::Parameters::Allow)
      ).to be true
      expect(
        ForbidiumParametersTestObject.include?(Forbidium::ActionController::Parameters::Forbid)
      ).to be true
    end
  end

  context 'Forbidium::Hash' do
    it 'includes namespaced Allow and Forbid modules when included' do
      class ForbidiumHashTestObject; end

      expect(
        ForbidiumHashTestObject.include?(Forbidium::Hash::Allow)
      ).not_to be true
      expect(
        ForbidiumHashTestObject.include?(Forbidium::Hash::Forbid)
      ).not_to be true

      ForbidiumHashTestObject.class_eval { include Forbidium::Hash }

      expect(
        ForbidiumHashTestObject.include?(Forbidium::Hash::Allow)
      ).to be true
      expect(
        ForbidiumHashTestObject.include?(Forbidium::Hash::Forbid)
      ).to be true
    end
  end

  it 'is included in Hash when required' do
    expect(Hash.include?(Forbidium::Hash)).to be true
  end
end
