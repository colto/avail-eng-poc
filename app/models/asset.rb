# frozen_string_literal: true

class Asset < ApplicationRecord
  validates :active_at, presence: true
  validate :active_and_inactive_overlap

  def self.for_time_period(start_at, end_at)
    where('active_at <= ? AND (inactive_at is NULL or inactive_at >= ?)', start_at, end_at)
  end

  private

  def active_and_inactive_overlap
    return unless inactive_at && active_at

    errors.add(:inactive_at, 'must be after the active date') if inactive_at < active_at
  end
end
