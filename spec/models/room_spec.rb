require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should have_many :guests}
    it {should belong_to :hotel}
  end
end