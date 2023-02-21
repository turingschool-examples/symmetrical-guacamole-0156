require 'rails_helper'

describe Guest, type: :model do
  describe 'relationships' do
    it {should have_many :guest_rooms}
  end
end