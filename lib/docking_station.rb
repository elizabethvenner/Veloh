require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY=20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
  end

  def release_bike
    raise 'No bikes available' if empty?
    @bikes.pop
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= capacity
  end

end
