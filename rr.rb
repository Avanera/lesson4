
class Rr
  attr_accessor :stations, :trains, :wagons, :routes

  def initialize
    @stations = []
    @trains = []
    @wagons = []
    @routes = []
    seed
  end

  def seed
    station1 = Station.new('M')
    @stations << station1
    station2 = Station.new('P')
    @stations << station2
    station3 = Station.new('N')
    @stations << station3

    route = Route.new("K", station1, station2)
    @routes << route

    route.add_station(station3)
    route.delete_station(station3)

    train = PassengerTrain.new('123', "Passenger")
    @trains << train

    train.take_route(route)
  end


  def create_station
    puts "Enter a station name"
    new_station = gets.chomp.capitalize!
    @stations << Station.new(new_station)
    puts "You have created a new station '#{new_station}'."
    puts @stations # delete
  end

  def create_train
    puts "Enter the number of the train"
    number = gets.chomp.to_i
    puts "Enter the type of the train: Passenger or Cargo."
    type = gets.chomp.capitalize!
    @trains << PassengerTrain.new(number, type) if type == "Passenger"
    @trains << CargoTrain.new(number, type) if type == "Cargo"
    puts "You have created a new #{type} train '#{number}'."
      puts @trains # delete
  end

  def create_wagon
    puts "Enter the type of the wagon: Passenger or Cargo."
    type = gets.chomp.capitalize!
    @wagons << PassengerWagon.new if type == "Passenger"
    @wagons << CargoWagon.new if type == "Cargo"
    puts "You have created a new #{type} wagon."
      puts @wagons # delete
  end

  def create_route
    puts "Enter the name of the route"
    name = gets.chomp.capitalize!
    puts "Enter the station of departure"
    d = gets.chomp.capitalize!  # здесь добавляется текст, а не объект

    @stations.each do |station|  # делаем из текста объект
    @depart = station if station.name == d
    end

    puts "Enter the station of arrival"
    a = gets.chomp.capitalize!

    @stations.each do |station|  # делаем из текста объект
      @arrive = station if station.name == a
    end

    route = Route.new(name, @depart, @arrive)
    @routes << route
    puts "You have created a new route #{route.name}: #{@depart.name} - #{@arrive.name} ." # ссылки не работают, если станции вводить с заглавной буквы.
    puts @routes # delete
    puts route.stations 
  end

  def create
    puts "Enter 1, if you want to create a station.
    Enter 2, if you want to create a train.
    Enter 3, if you want to create a wagon.
    Enter 4, if you want to create a route.
    Enter 0, if you want to go back."
    create_case = gets.chomp.to_i
    case create_case
    when 1
      create_station
    when 2
      create_train
    when 3
      create_wagon
    when 4
      create_route
    when 0
      start          
    end
  end

  def add_station_to_route
    puts "Enter the route name you want to add a station to:"
    r = gets.chomp.capitalize! #K1

    @routes.each do |route|  # делаем из текста объект
    @route = route if route.name == r # @route - маршрут, который мы хотим изменить.
    end

    puts "Enter the name of the station you want to add:"
    s = gets.chomp.capitalize! # N

    @stations.each do |station|  # делаем из текста объект
    @station = station if station.name == s # @station - объект, который мы хотим добавить
    end

    @route.add_station(@station)
    puts "You have added a station #{@station.name} to the route #{@route.name}."
    puts @route # delete
    puts @routes # delete
  end

  def delete_station_from_route
    puts "Enter the route name you want to delete a station from:"
    r = gets.chomp.capitalize! #K1

    @routes.each do |route|  # делаем из текста объект
    @route = route if route.name == r # @route - маршрут, который мы хотим изменить.
    end

    puts "Enter the name of the station you want to delete:"
    s = gets.chomp.capitalize! # N

    @stations.each do |station|  # делаем из текста объект
    @station = station if station.name == s # @station - объект, который мы хотим добавить
    end

    @route.delete_station(@station)
    puts "You have deleted a station #{@station.name} from the route #{@route.name}."
    puts @route # delete
    puts @routes # delete
  end

  def speed_up
    puts "Enter the train number:"
    num = gets.chomp.to_i
    puts "Enter how much you want to speed up the train:"
    kmh = gets.chomp.to_i

    @trains.each do |train|  # делаем из номера объект
    @train = train if train.number == num # @train - поезд, который мы хотим ускорить.
    end

    @train.go(kmh)
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
    operate_case = gets.chomp.to_i
    case operate_case
    when 1
    add_station_to_route
    when 2
    delete_station_from_route
    when 3
    speed_up
    when 4
    brake
    when 5
      stop
    when 6
      add_wagons
    when 7
      delete_wagons
    when 8
      take_route
    when 9
      forward
    when 10
      backward
    when 0
      start               
    end
  end

  def start
    i = nil
    while i != 0 do   # почему-то приходится 3 раза вводить 0, чтобы выйти из программы
      puts "Enter 1, if you want to create a station. train, wagon or route.
      Enter 2, if you want to operate these objects.
      Enter 3, if you want to receive current data about objects.
      Enter 0, if you want to quit the program."
      i = gets.chomp.to_i
      create if i == 1
      operate if i == 2
    end
  end


end
