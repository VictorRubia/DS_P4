class Empleados

  attr_accessor :id_empleado,:nombre, :dni, :meses, :password

  def initialize(id_empleado, nombre, dni, password)
    @id_empleado = id_empleado
    @nombre, = nombre
    @dni= dni
    @password= password
  end

end
