class Train
  attr_accessor :speed
  attr_reader :current_station, :route, :number, :type, :wagons

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
  end

  def go(speed)
    @speed += speed
    puts "The train #{self.number} goes with #{@speed} speed."
  end

  def break(speed)
    @speed = @speed - speed 
    @speed = 0 if @speed < 0 
    puts "The train #{self.number} goes with #{@speed} speed."
  end

  def stop
    @speed = 0
    puts "The train #{self.number} stopped."
  end

  def show_speed
    puts "The current speed of train #{self.number} is #{@speed}."
  end

  def show_wagons
    puts "The wagons quantity of train #{self.number} is #{@wagons.size}."
  end

  def add_wagons(wagon)
    @wagons << wagon if @speed == 0
    puts "The wagons quantity of train #{self.number} is #{@wagons.size}."
  end

  def delete_wagons(wagon)
    @wagons.delete(wagon) if @speed == 0 && @wagons.size >= 1  
    puts "The wagons quantity of train #{self.number} is #{@wagons.size}."
  end

=begin
  def show_wagons
    puts "The wagons quantity of train #{self.number} is #{@wagons}."
  end

  def add_wagons
    @wagons += 1 if @speed == 0
    puts "The wagons quantity of train #{self.number} is #{@wagons}."
  end

  def delete_wagons
    @wagons += @wagons - 1 if @speed == 0 && @wagons >= 1
    puts "The wagons quantity of train #{self.number} is #{@wagons}."
  end
=end
  def take_route(route)
    @route = route 
    # чтобы def next_station работал, надо сохранить route и создать для него attr_reader =>  route = route1
    # внутри поезда мы же не знаем о каком маршруте идет речь
    @current_station = @route.depart
    puts "The train #{self.number} took #{@route.stations[0].name} - #{@route.stations[-1].name} route and is currently in #{@current_station.name}."
    @route.depart.receive_train(self)
  end

  def forward
    if @current_station != @arrive
      @current_station.send_train(self)
      next_station.receive_train(self) #тут вызываем метод next_station = self.next_station
      @current_station = next_station
      puts "The train #{self.number} is currently in #{@current_station.name}."
    end
  end

  def backward
    if @current_station != @depart
      @current_station.send_train(self)
      prev_station.receive_train(self)
      @current_station = prev_station
      puts "The train #{self.number} is currently in #{@current_station.name}."
    end
  end

protected # потому что их не нужно вызывать вне класса, но он нужен в подклассах.

  def next_station
    i = @route.stations.index(@current_station)
    @route.stations[i + 1] # метод возвращает значение, лишнюю переменную не нужно создавать.  
  end

  def prev_station
    i = @route.stations.index(@current_station)
    @route.stations[i - 1]    
  end
end



