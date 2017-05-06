module Cofidin33
  class RetencionComprobante
    attr_accessor :impuesto
    attr_accessor :importe

    def atributos_sat
      datos = {}
      datos[:Impuesto] = impuesto
      datos[:Importe] = importe
      datos
    end

    def from_hash(params)
      @impuesto = params[:impuesto]
      @importe = params[:importe]
    end

    def cadena_original
      campos_cadena = [
        :impuesto,
        :importe
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end

  end
end
