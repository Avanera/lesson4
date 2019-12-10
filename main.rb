#load './station.rb'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
@stations = []
@passenger_trains = []
@cargo_trains = []
@passenger_wagons = []
@cargo_wagons = []
@routes = []


def create_station
  puts "Enter a station name"
  new_station = gets.chomp.capitalize!
  @stations << Station.new(new_station)
  puts "You have created a new station '#{new_station}'."
  puts @stations
end

def create_train
  puts "Enter the number of the train"
  number = gets.chomp.to_i
  puts "Enter the type of the train: Passenger or Cargo."
  type = gets.chomp.capitalize!
  @passenger_trains << PassengerTrain.new(number, type) if type == "Passenger"
  @cargo_trains << CargoTrain.new(number, type) if type == "Cargo"
  puts "You have created a new #{type} train '#{number}'."
    puts @passenger_trains # delete
    puts @cargo_trains
end

def create_wagon
  puts "Enter the type of the wagon: Passenger or Cargo."
  type = gets.chomp.capitalize!
  @passenger_wagon << PassengerWagon.new if type == "Passenger"
  @cargo_wagon << CargoWagon.new if type == "Cargo"
  puts "You have created a new #{type} wagon."
    puts @passenger_wagons
    puts @cargo_wagons
end

def create_route
  puts "Enter the name of the route"
  @name = gets.chomp.capitalize!
  puts "Enter the station of departure"
  @depart = gets.chomp.capitalize!
  puts "Enter the station of arrival"
  @arrive = gets.chomp.capitalize!
  @routes << Route.new(@depart, @arrive)
  puts "You have created a new route #{@name}: #{@depart} - #{@arrive} ." # ссылки не работают, если станции вводить с заглавной буквы.
  puts @routes
end


def create
  puts "Enter 1, if you want to create a station.
  Enter 2, if you want to create a train.
  Enter 3, if you want to create a wagon.
  Enter 4, if you want to create a route.
  Enter 0, if you want to go back."
  i = gets.chomp.to_i
  create_station if i == 1
  create_train if i == 2
  create_wagon if i == 3
  create_route  if i == 4
  start if i == 0                     # TODO пойти в начало цикла
end

def add_st
  puts "Enter the route name you want to add a station to:"
  r = gets.chomp.capitalize! #K1
  puts "Enter the name of the station you want to add:"
  s = gets.chomp.capitalize! # N
  station = @stations.index(s) # 2
  route = @routes.index(r) # 0
  @routes[route].add_station(station) #in `add_st': no implicit conversion from nil to integer (TypeError)
  puts @routes

end




def operate
  puts "Enter 1, if you want to add a station to a route.
  Enter 2, if you want to delete a station from a route.
  Enter 3, if you want to speed up a train.
  Enter 4, if you want to break speed of a train.
  Enter 5, if you want to stop a train.
  Enter 6, if you want to connect wagons to a train.
  Enter 7, if you want to disconnect wagons from a train.
  Enter 8, if you want a train to take a route.
  Enter 9, if you want to move a train forward.
  Enter 10, if you want to move a train backward.
  Enter 0, if you want to go back."
  i = gets.chomp.to_i
  add_st if i == 1
  delete_station if i == 2
  speed_up if i == 3
  brake if i == 4
  stop if i == 5
  add_wagons if i == 6
  delete_wagons if i == 7
  take_route if i == 8
  forward if i == 9
  backward if i == 10
  start if i == 0                     # TODO пойти в начало цикла
end


loop do
  puts "Enter 1, if you want to create a station. train, wagon or route.
  Enter 2, if you want to operate these objects.
  Enter 3, if you want to receive current data about objects.
  Enter 0, if you want to quit the program."
  i = gets.chomp.to_i
  break if i == 0

  create if i == 1
  operate if i == 2
    
end

puts stations
puts passenger_trains
puts cargo_trains
puts passenger_wagons
puts cargo_wagons
puts routes




=begin


station1 = Station.new("Moscow")
station2 = Station.new("Saint-Petersburg")
station3 = Station.new("Krasnoyarsk")
station4 = Station.new("Novosibirsk")
station5 = Station.new("Vladivostok")
station6 = Station.new("Nalchik")

#load './route.rb'

route1 = Route.new(station1, station6)
route1.add_station(station3)
route1.add_station(station4)
route1.add_station(station5)

route1.show_stations

route1.delete_station(station4)

route1.show_stations

#load './train.rb'

train1 = PassengerTrain.new(123, "Passenger")
train1.go(50)
train1.break(30)
train1.stop
train1.show_speed
train1.show_wagons_quant
#train1.add_wagons
#train1.delete_wagons

train1.take_route(route1)

train1.forward

train1.backward

train2 = CargoTrain.new(345, "Cargo")
train2.take_route(route1)

station1.show_trains("Passenger")
station1.show_trains("Cargo")
station2.show_trains("Passenger")

wagon1 = PassengerWagon.new
wagon2 = CargoWagon.new

train1.add_wagons(wagon1)
train1.delete_wagons(wagon1)
train1.show_wagons_quant

train2.add_wagons(wagon2)
train2.delete_wagons(wagon2)
train2.show_wagons_quant

=begin
  
rescue Exception => e
  
end

wagon1.connect(train1)
wagon1.disconnect(train1)


wagon2.connect(train2)
wagon2.disconnect(train2)
=end
