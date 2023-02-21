require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'relationships' do
    it { should have_many :room_guests }
    it { should have_many :rooms }
  end
end
