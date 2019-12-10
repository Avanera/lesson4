class Route
  attr_reader :stations, :depart, :arrive

  def initialize(depart, arrive)
    @depart = depart
    @arrive = arrive
    @stations = [@depart, @arrive]
  end

  def add_station(station)
    @stations.insert(-2, station) # добавить элемент в любое место массива
  end

  def delete_station(station)
    @stations.delete(station) if station != @depart && station != @arrive
  end

  def show_stations
    puts "Route 1:"
    @stations.each.with_index(1) do |station, index|
      puts "Station #{index}: #{station.name}."
    end
  end
end
    




