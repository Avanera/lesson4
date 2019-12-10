class PassengerTrain < Train
  def add_wagons(wagon)
    @wagons_quant << wagon if @speed == 0 && wagon.class == PassengerWagon
    super
  end
end
