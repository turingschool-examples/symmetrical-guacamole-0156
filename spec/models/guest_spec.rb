require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should have_many :room_guests}
  it { should have_many(:rooms).through(:room_guests) }
end
