module Cofidin
  class Retencion
    attr_accessor :impuesto
    attr_accessor :importe

    def atributos
      {
        impuesto: impuesto,
        importe: importe
      }
    end
  end
end
