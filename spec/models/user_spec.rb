require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:events) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'method' do
  end
end
