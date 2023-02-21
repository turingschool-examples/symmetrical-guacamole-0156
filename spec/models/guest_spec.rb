require 'rails_helper'

RSpec.describe Guest do 
  describe 'relationships' do 
    it {should have_many :guest_rooms}
    it {should have_many :rooms}
  end
end