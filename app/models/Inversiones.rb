class Inversiones

  attr_accessor :id_inversion,:id_cuenta, :cantidad, :meses, :interes

  def initialize(id_inversion, id_cuenta, cantidad, meses, interes)
    @id_inversion = id_inversion
    @id_cuenta = id_cuenta
    @cantidad = cantidad
    @meses = meses
    @interes = interes
  end

end
