# frozen_string_literal: true

class AvailabilityGrouping
  include Availability

  attr_reader :start_at, :end_at

  def initialize(start_at:, end_at:)
    @start_at = DateTime.parse(start_at.to_s)
    @end_at = DateTime.parse(end_at.to_s)
  end

  private

  def booking_count
    booking_groups.count
  end

  def booking_groups
    @booking_groups ||= begin
      groups = []
      bookings.by_start.each do |ungrouped_booking|
        placed = false
        groups.each do |grouping|
          grouping.each do |booking|
            break if ungrouped_booking.overlap?(booking)
            next unless booking == grouping.last

            grouping << ungrouped_booking
            placed = true
          end
          break if placed
        end
        groups << [ungrouped_booking] unless placed
      end
      groups
    end
  end
end
