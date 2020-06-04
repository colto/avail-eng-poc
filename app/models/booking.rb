# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_and_end_overlap

  scope :by_start, -> { order(:start_at) }
  scope :for_time_period, ->(start_at, end_at) { where('start_at <= ? and end_at >= ?', end_at, start_at) }

  def overlap?(booking)
    !(start_at >= booking.end_at || end_at <= booking.start_at)
  end

  private

  def start_and_end_overlap
    return unless end_at && start_at

    errors.add(:end_at, 'must be after the start date') if end_at < start_at
  end
end
