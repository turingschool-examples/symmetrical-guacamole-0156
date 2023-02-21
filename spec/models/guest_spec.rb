require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it { should have_many :room_guests }
    it { should have_many :rooms }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :nights }
    it { should validate_numericality_of :nights }

  end
end
