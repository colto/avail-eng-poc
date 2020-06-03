require 'rails_helper'

RSpec.describe Asset, type: :model do
  subject { build(:asset ) }

  describe '#validations' do
    it { is_expected.to validate_presence_of(:active_at) }

    it 'doesn\'t allow inactive_at to be before active_at' do
      subject.inactive_at = subject.active_at - 5.days
      expect(subject.valid?).to eq(false)
    end
  end
end
