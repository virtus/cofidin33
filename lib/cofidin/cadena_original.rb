module Cofidin
  class CadenaOriginal
    def self.call(comprobante)

      cadena = comprobante.emisor.domicilio.atributos.values.join '|'
    end
  end
end
