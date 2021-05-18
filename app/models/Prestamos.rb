
class Prestamos

  attr_accessor :id_prestamo, :cantidad, :cuotas, :interes

  def initialize(id,cantidad,cuotas,interes)
    @id_prestamo = id
    @cantidad = cantidad
    @cuotas = cuotas
    @interes = interes
  end
end