class CargoTrain < Train
  def add_wagons(wagon)
    @wagons_quant << wagon if @speed == 0 && wagon.class == CargoWagon
    super
  end
end
