module Cofidin33
  class TrasladoConcepto
    attr_accessor :base
    attr_accessor :impuesto
    attr_accessor :tipo_factor
    attr_accessor :tasa_o_cuota
    attr_accessor :importe

    def atributos_sat
      datos = {}
      datos[:Base] = base
      datos[:Impuesto] = impuesto
      datos[:TipoFactor] = tipo_factor
      datos[:TasaOCuota] = tasa_o_cuota if tasa_o_cuota
      datos[:Importe] = importe if importe
      datos
    end

    def from_hash(params)
      @base = params[:base]
      @impuesto = params[:impuesto]
      @tipo_factor = params[:tipo_factor]
      @tasa_o_cuota = params[:tasa_o_cuota]
      @importe = params[:importe]

    end

    def cadena_original
      campos_cadena = [
        :base,
        :impuesto,
        :tipo_factor,
        :tasa_o_cuota,
        :importe
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end

  end
end
