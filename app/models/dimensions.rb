class Dimensions
  attr_accessor :height, :width, :depth

  def initialize(height: nil, width: nil, depth: nil)
    @height = height
    @width = width
    @depth = depth
  end

  def empty?
    !@height && !@width && !@depth
  end

  def to_s
    [@height, @width, @depth].
      map { |measurement| convert_inches_to_feet_and_inches(measurement) }.
      reject { |measurement| measurement.blank? }.
      join(' x ')
  end

  private

  def convert_inches_to_feet_and_inches(inches)
    return if inches.blank?

    feet = (inches / 12).to_i
    remaining_inches = inches % 12

    feet_and_inches = ''
    feet_and_inches += "#{feet}' " if feet > 0
    feet_and_inches += "#{remaining_inches}\"" if remaining_inches > 0
    feet_and_inches.strip
  end
end
