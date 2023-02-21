require 'rails_helper'

RSpec.describe GuestRoom, type: :model do
  it { should belong_to :room }
  it { should belong_to :guest }
end
