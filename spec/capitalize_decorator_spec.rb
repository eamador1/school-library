require_relative 'spec_helper'

describe 'capitalize_decoration' do
  before(:each) do
    @nameable = double('nameable')
    allow(@nameable).to receive(:correct_name) { 'jonathan' }
  end

  it 'capitalizes nameable' do
    capitalize = CapitalizeDecorator.new(@nameable)
    expect(capitalize.correct_name).to eql('Jonathan')
  end
end
