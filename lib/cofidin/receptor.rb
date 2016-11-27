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

    def atributos=(params)
      self.rfc = params[:rfc]
      self.nombre = params[:nombre]
    end
  end
end
