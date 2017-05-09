module Cofidin33
  class GeneraCadenaOriginal
    def self.call(comprobante)
      cadenas = []
      cadenas << comprobante.cadena_original
      cadenas << comprobante.emisor.cadena_original
      cadenas << comprobante.receptor.cadena_original
      comprobante.conceptos.each do |concepto|
        cadenas << concepto.cadena_original
        concepto.impuestos.traslados.each do |traslado|
          cadenas << traslado.cadena_original
        end
        concepto.impuestos.retenciones.each do |retencion|
          cadenas << retencion.cadena_original
        end
      end
      comprobante.impuestos.retenciones.each do |retencion|
        cadenas << retencion.cadena_original
      end
      if comprobante.impuestos.retenciones.count > 0
        cadenas << comprobante.impuestos.total_impuestos_retenidos
      end
      comprobante.impuestos.traslados.each do |traslado|
        cadenas << traslado.cadena_original
      end
      if comprobante.impuestos.traslados.count > 0
        cadenas << comprobante.impuestos.total_impuestos_trasladados
      end
      cadena = cadenas.join '|'
      '||' + cadena + '||'
    end
  end
end
