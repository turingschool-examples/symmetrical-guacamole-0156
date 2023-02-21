require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:echo) { Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain') }
  let!(:winterpark) { Hotel.create!(name: 'Winter Park Hotel', location: 'Winter Park') }

  let!(:presedential) { echo.rooms.create!(rate: 125, suite: "Presedential") }
  let!(:b27) { winterpark.rooms.create!(rate: 60, suite: "b27") }


  describe 'relationships' do
    it {should belong_to :hotel}
    it { should have_many(:guests).through(:guest_rooms) }
  end
end