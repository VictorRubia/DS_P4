class Movimientos

  attr_accessor :id_movimiento, :cantidad

  def initialize(id, cantidad)
    @id_movimiento = id
    @cantidad = cantidad
  end
end
