require 'pry'
require_relative 'spec_helper'


describe 'teacher' do
  before(:each) do
    allow(Random).to receive(:rand).and_return(387)
    @teacher = Teacher.new('Isabella', 24, 'math')
  end

  context '#parent_permission' do
    it 'can use service' do
      expect(@teacher.parent_permission).to eql(true)
    end
  end

  context '#to_hash' do
    it 'returns a hash with specialization' do
      expected_hash = {
        json_class: 'Teacher',
        id: 387,
        name: 'Isabella',
        age: 24,
        parent_permission: true,
        specialization: 'math'
      }

      expect(@teacher.to_hash).to eql(expected_hash)
    end
  end

  context '#self.from_hash' do
    it 'instatiate a new object' do
      hash_data = {
        json_class: 'Teacher',
        id: 387,
        name: 'Isabella',
        age: 24,
        parent_permission: true,
        specialization: 'math'
      }

      teacher_instance = Teacher.from_hash(hash_data)

      expect(teacher_instance).to be_a(Teacher)
    end
  end
end
