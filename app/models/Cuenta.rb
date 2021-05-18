
class Cuenta

  attr_accessor :id_cuenta, :iban, :saldo

  def initialize( id_cuenta, iban, saldo )
    @id_cuenta = id_cuenta
    @iban = iban
    @saldo = saldo
    @movimientos
    @tarjetas
    @inversiones
    @prestamos
    @transferencias
  end
end
