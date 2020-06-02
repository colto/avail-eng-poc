# frozen_string_literal: true

class Asset < ApplicationRecord
  def self.for_time_period(start_at, end_at)
    where('active_at <= ? AND (inactive_at is NULL or inactive_at >= ?)', start_at, end_at)
  end
end
