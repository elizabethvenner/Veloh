require 'docking_station'

describe DockingStation do
  station = DockingStation.new

  describe '#release_bike' do
    it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq(bike)
    end

    it 'releases working bikes' do
        bike = Bike.new
        subject.dock(bike)
        bike = subject.release_bike
        expect(bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'dock something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

  end

  describe '#dock' do

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike
     end

    it 'raises an error when station is full' do
        bike1 = Bike.new
        subject.dock(bike1)
        bike2 = Bike.new
        expect { subject.dock(bike2) }.to raise_error 'Docking station is full'
    end

  end

    it { is_expected.to respond_to(:bike) }



end
