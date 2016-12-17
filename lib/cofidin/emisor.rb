module Cofidin
  class Emisor
    attr_accessor :rfc
    attr_accessor :nombre

    attr_accessor :domicilio_fiscal

    def initialize
      self.domicilio_fiscal = Cofidin::Ubicacion.new
    end

    def atributos_sat
      {
        rfc: rfc,
        nombre: nombre
      }
    end

    def atributos_sat=(params)
      self.rfc = params[:rfc]
      self.nombre = params[:nombre]
    end

    def cadena_original
      campos_cadena = [
        :rfc,
        :nombre
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
