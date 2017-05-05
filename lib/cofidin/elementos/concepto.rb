module Cofidin
  class Concepto
    attr_accessor :clave_prod_serv
    attr_accessor :no_identificacion
    attr_accessor :cantidad
    attr_accessor :clave_unidad
    attr_accessor :unidad
    attr_accessor :descripcion
    attr_accessor :valor_unitario
    attr_accessor :importe
    attr_accessor :descuento
    attr_accessor :impuestos

    def initialize
      self.impuestos = Cofidin::ImpuestosConcepto.new
    end

    def atributos_sat
      datos = {}
      datos[:ClaveProdServ] = clave_prod_serv
      datos[:NoIdentificacion] = no_identificacion if no_identificacion
      datos[:Cantidad] = cantidad
      datos[:ClaveUnidad] = clave_unidad
      datos[:Unidad] = unidad if unidad
      datos[:Descripcion] = descripcion
      datos[:ValorUnitario] = valor_unitario
      datos[:Importe] = importe
      datos[:Descuento] = descuento if descuento
      datos
    end

    def from_hash(params)
      @clave_prod_serv = params[:clave_prod_serv]
      @no_identificacion = params[:no_identificacion]
      @cantidad = params[:cantidad]
      @clave_unidad = params[:clave_unidad]
      @unidad = params[:unidad]
      @descripcion = params[:descripcion]
      @valor_unitario = params[:valor_unitario]
      @importe = params[:importe]
      @descuento = params[:descuento]
    end

    def cadena_original
      campos_cadena = [
        :clave_prod_serv,
        :no_identificacion,
        :cantidad,
        :clave_unidad,
        :unidad,
        :descripcion,
        :valor_unitario,
        :importe,
        :descuento
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
