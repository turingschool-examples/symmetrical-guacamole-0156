require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
		it {should have_many :guests}
    it {should have_many :room_guests}
  end
end