module Cofidin
  class Concepto
    attr_accessor :cantidad
    attr_accessor :unidad
    attr_accessor :no_identificacion
    attr_accessor :descripcion
    attr_accessor :valor_unitario
    attr_accessor :importe

    def atributos_sat
      datos = {}
      datos[:cantidad] = cantidad
      datos[:unidad] = unidad
      datos[:noIdentificacion] = no_identificacion if no_identificacion
      datos[:descripcion] = descripcion
      datos[:valorUnitario] = valor_unitario
      datos[:importe] = importe
    end

    def atributos_sat=(params)
      self.cantidad = params[:cantidad]
      self.unidad = params[:unidad]
      self.no_identificacion = params[:noIdentificacion]
      self.descripcion = params[:descripcion]
      self.valor_unitario = params[:valorUnitario]
      self.importe = params[:importe]
    end

    def cadena_original
      campos_cadena = [
        :cantidad,
        :unidad,
        :no_identificacion,
        :descripcion,
        :valor_unitario,
        :importe
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
