class Transferencias

  attr_accessor :id_transferencia,:id_cuenta_origen, :id_cuenta_destino, :cantidad

  def initialize(id_transferencia, id_cuenta_origen, id_cuenta_destino, cantidad)
    @id_transferencia = id_transferencia
    @id_cuenta_origen = id_cuenta_origen
    @id_cuenta_destino = id_cuenta_destino
    @cantidad = cantidad
  end

end
