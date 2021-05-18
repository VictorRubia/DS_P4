
class Clientes

  attr_accessor :id_cliente, :nombre, :dni, :nomina

  def initialize(id, nombre, dni, nomina)
    @id_cliente = id
    @nombre = nombre
    @dni = dni
    @nomina = nomina
  end

end