require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject { build(:booking) }

  describe '#validations' do
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }

    it 'doesn\'t allow end_at to be before start_at' do
      subject.end_at = subject.start_at - 5.days
      expect(subject.valid?).to eq(false)
    end
  end

  describe '#overlap?' do
    let(:booking) { build(:booking) }

    it 'returns true if the bookings overlap on start' do
      booking.start_at = subject.end_at - 1.second
      expect(subject.overlap?(booking)).to eq(true)
    end

    it 'returns true if the bookings overlap on end' do
      booking.end_at = subject.start_at + 1.second
      expect(subject.overlap?(booking)).to eq(true)
    end

    it 'returns false if the bookings do not overlap' do
      booking.end_at = subject.start_at - 10.days
      booking.start_at = booking.end_at
      expect(subject.overlap?(booking)).to eq(false)
    end
  end
end
