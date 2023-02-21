class Guest < ApplicationRecord
  has_many :guest_rooms
  has_many :rooms, through: :guest_rooms

  validates_presence_of :name, presence: true

  def self.total_count
    distinct.count(:id)
  end

  def self.uniq_guest_names
    distinct.pluck(:name)
  end

end