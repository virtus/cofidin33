module Cofidin
  class Retencion
    attr_accessor :impuesto
    attr_accessor :importe

    def atributos_sat
      datos = {}
      datos[:impuesto] = impuesto
      datos[:importe] = importe
      datos
    end

    def atributos_sat=(params)
      self.impuesto = params[:impuesto]
      self.importe = params[:importe]
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
