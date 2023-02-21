require 'rails_helper'

RSpec.describe Guest do 
  describe 'relationships' do 
    it {should have_many :guest_rooms}
    it {should have_many :rooms}
  end

  describe 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_numericality_of :nights}
  end
end