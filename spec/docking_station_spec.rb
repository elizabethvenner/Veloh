require 'docking_station'

describe DockingStation do
  # station = DockingStation.new

  describe '#release_bike' do
    it 'releases a bike' do
      expect(subject).to respond_to(:release_bike)
    end
  end

end
