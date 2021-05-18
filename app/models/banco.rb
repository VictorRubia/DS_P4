class Banco < ApplicationRecord
  def initialize()
    super
    inicia sesion
    @cliente = guardamos el id cliente

    SELECT FROM cuentas WHERE idCliente= @cliente

    @cuenta = new Cuenta(parametros obtenidos de la base de datos)

    @cuenta.prestamo.id_cliente

    @cuenta.prestamo
  end

  def comprobarDeudas

  end
end