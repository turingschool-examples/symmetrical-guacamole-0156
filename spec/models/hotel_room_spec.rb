require 'rails_helper'

RSpec.describe HotelRoom, type: :model do
  
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should belong_to :room}
  end
end
