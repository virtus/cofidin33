module Cofidin
  class Traslado
    attr_accessor :impuesto
    attr_accessor :tasa
    attr_accessor :importe

    def atributos_sat
      datos = {}
      datos[:impuesto] = impuesto
      datos[:tasa] = tasa
      datos[:importe] = importe
      datos
    end

    def atributos_sat=(params)
      self.impuesto = params[:impuesto]
      self.tasa = params[:tasa]
      self.importe = params[:importe]
    end

    def cadena_original
      campos_cadena = [
        :impuesto,
        :tasa,
        :importe
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
