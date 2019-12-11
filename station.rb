class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end


  def show_trains(type)
    @trains.each do |train|
      puts "Passenger trains located in #{self.name}: #{train.number}" if train.type == "Passenger" && type == train.type
      puts "Cargo trains located in #{self.name}: #{train.number}" if train.type == "Cargo" && type == train.type
    end
  end

  def receive_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

end
