class Dimensions
  def initialize(height: nil, width: nil, depth: nil)
    @measurements = { h: height, w: width, d: depth }
  end

  def empty?
    @measurements.all? { |label, measurement| measurement.blank? }
  end

  def to_s
    @measurements.
      map { |label, measurement| measurement_to_s(label, measurement) }.
      compact.
      join(' ')
  end

  private

  def measurement_to_s(label, measurement)
    return if measurement.blank? || measurement.zero?
    "#{label.capitalize}: #{convert_inches_to_feet_and_inches(measurement)}"
  end

  def convert_inches_to_feet_and_inches(inches)
    return if inches.blank?

    feet = (inches / 12).to_i
    remaining_inches = inches % 12

    feet_and_inches = ''
    feet_and_inches += "#{feet}ft " if feet > 0
    feet_and_inches += "#{remaining_inches}in" if remaining_inches > 0
    feet_and_inches.strip
  end
end
