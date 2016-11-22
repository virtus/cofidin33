module Cofidin
  class Receptor
    attr_accessor :rfc
    attr_accessor :nombre

    attr_accessor :domicilio

    def initialize
      self.domicilio = Cofidin::Ubicacion.new
    end

    def atributos
      {
        rfc: rfc,
        nombre: nombre
      }
    end
  end
end
