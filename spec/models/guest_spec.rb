require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it { should have_many :guest_rooms }
    it { should have_many(:rooms).through(:guest_rooms)}
  end
end