module Cofidin
  class Concepto
    attr_accessor :cantidad
    attr_accessor :unidad
    attr_accessor :no_identificacion
    attr_accessor :descripcion
    attr_accessor :valor_unitario
    attr_accessor :importe

    def atributos
      {
        cantidad: cantidad,
        unidad: unidad,
        noIdentificacion: no_identificacion,
        descripcion: descripcion,
        valorUnitario: valor_unitario,
        importe: importe
      }
    end
  end
end
