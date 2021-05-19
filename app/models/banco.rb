require_relative 'cuenta'
require_relative 'cliente'


class Banco < ApplicationRecord
  def initialize(idCliente)
    super

    @cliente = new Cliente()
    @cuenta = new Cuenta()

  end

  def comprobarDeudas

  end
end