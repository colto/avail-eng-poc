# frozen_string_literal: true

class AvailabilitySlice
  include Availability

  DEFAULT_TIME_SLICE = 15.minutes

  attr_reader :start_at, :end_at, :time_slice

  def initialize(start_at:, end_at:, time_slice: DEFAULT_TIME_SLICE)
    @start_at = DateTime.parse(start_at.to_s)
    @end_at = DateTime.parse(end_at.to_s)
    @time_slice = time_slice
  end

  private

  def booking_count
    @bookings_count ||= begin
      booking_count_queries.map do |query|
        result = Booking.connection.exec_query(query)
        result.rows.flatten.max
      end.max
    end
  end

  def booking_count_queries
    count_queries.map { |query| Booking.sanitize_sql(bookings.select(query).to_sql) }
  end

  def count_queries
    time_slices.each_slice(500).map do |slice|
      slice.map { |time| "COUNT(*) FILTER (WHERE start_at <= '#{time}' AND end_at >= '#{time}')" }.join(', ')
    end
  end

  def time_slices
    @time_slices ||= start_at.step(end_at, duration)
  end

  def duration
    # 1 day / (hour fraction * 24 hours)
    @duration ||= 1.0 / ((1.hour / time_slice) * 24)
  end
end
