require 'rails_helper'

RSpec.describe RoomGuest, type: :model do
  describe 'relationships' do
    it {should belong_to :room}
    it {should belong_to :guest}
   
  end
end
