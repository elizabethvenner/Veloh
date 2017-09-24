require 'docking_station'

describe DockingStation do

    describe '#initialize' do
        subject { DockingStation.new }
        let(:bike) { Bike.new }

        it 'default capacity' do
            described_class::DEFAULT_CAPACITY.times do
                subject.dock(bike)
            end
            expect { subject.dock(bike) }.to raise_error 'Docking station is full'
        end

        it 'has a variable capacity' do
            docking_station = DockingStation.new(50)
            50.times { docking_station.dock(Bike.new) }
            expect { docking_station.dock(Bike.new) }.to raise_error 'Docking station is full'
        end
    end

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

  end

  describe '#dock' do

     it 'dock something' do
          bike = Bike.new
          expect(subject.dock(bike)).to eq [bike]
     end

     it 'raises an error when station is full' do
         subject.capacity.times { subject.dock(Bike.new) }
         bike = Bike.new
         expect { subject.dock(bike) }.to raise_error 'Docking station is full'
     end

  end

    it { is_expected.to respond_to(:bikes) }

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bikes).to eq [bike]
     end



end
