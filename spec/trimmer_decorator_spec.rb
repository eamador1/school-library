require_relative 'spec_helper'

describe 'trimmer_decoration' do
  before(:each) do
    @nameable = double('nameable')
    allow(@nameable).to receive(:correct_name) { 'supercalifragilisticexpialidocious' }
  end

  it 'trims nameable' do
    trimmer = TrimmerDecorator.new(@nameable)
    expect(trimmer.correct_name).to eql('supercalif')
  end
end
