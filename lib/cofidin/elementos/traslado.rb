module Cofidin
  class Traslado
    attr_accessor :impuesto
    attr_accessor :tasa
    attr_accessor :importe

    def atributos
      {
        impuesto: impuesto,
        tasa: tasa,
        importe: importe
      }
    end
  end
end
