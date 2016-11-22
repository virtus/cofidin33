module Cofidin
  class Emisor
    attr_accessor :rfc
    attr_accessor :nombre

    attr_accessor :domicilio_fiscal

    def initialize
      self.domicilio_fiscal = Cofidin::Ubicacion.new
    end

    def atributos
      {
        rfc: rfc,
        nombre: nombre
      }
    end
  end
end
