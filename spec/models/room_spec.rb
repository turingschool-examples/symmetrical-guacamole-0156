require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it { should belong_to :hotel }

    it { should have_many :room_guests }
    it { should have_many :guests }
  end

  describe 'validations' do
    it { should validate_presence_of :suite }
    it { should validate_presence_of :rate }
    it { should validate_numericality_of :rate }
  end
end