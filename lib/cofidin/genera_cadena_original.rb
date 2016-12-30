module Cofidin
  class GeneraCadenaOriginal
    def self.call(comprobante)
      cadenas = []
      cadenas << comprobante.cadena_original
      cadenas << comprobante.emisor.cadena_original
      cadenas << comprobante.emisor.domicilio_fiscal.cadena_original
      cadenas << comprobante.emisor.regimen_fiscal.cadena_original
      cadena = cadenas.join '|'
      '||' + cadena + '||'
    end
  end
end
