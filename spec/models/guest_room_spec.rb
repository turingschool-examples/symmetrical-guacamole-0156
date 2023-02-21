require 'rails_helper'

RSpec.describe GuestRoom do 
  describe 'relationships' do 
    it {should belong_to :guest}
    it {should belong_to :room}
  end
end