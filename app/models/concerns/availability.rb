# frozen_string_literal: true

module Availability
  extend ActiveSupport::Concern

  def availablility
    available_asset_count - booking_count
  end

  def available?
    availablility.positive?
  end

  def result_hash
    { booking_count: booking_count, available_asset_count: available_asset_count }
  end

  private

  def bookings
    @bookings ||= Booking.for_time_period(start_at, end_at)
  end

  def available_asset_count
    Asset.for_time_period(start_at, end_at).count
  end
end
