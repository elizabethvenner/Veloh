require 'docking_station'

describe DockingStation do
  station = DockingStation.new

  describe '#release_bike' do
    it 'releases a bike' do
      expect(subject).to respond_to(:release_bike)
    end

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'dock something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
    end

    it { is_expected.to respond_to(:bike) }


  end

end
