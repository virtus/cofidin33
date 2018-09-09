module Cofidin33
  class CreaComprobante
    def self.call(hash:)
      comprobante = Cofidin33::Comprobante.new
      comprobante.from_hash hash
      comprobante.emisor.from_hash hash[:emisor]
      comprobante.receptor.from_hash hash[:receptor]
      hash[:conceptos].each do |c|
        concepto = Cofidin33::Concepto.new
        concepto.from_hash c
        if hash[:tipo_de_comprobante] != 'P'
          c[:impuestos][:traslados].each do |t|
            traslado = Cofidin33::TrasladoConcepto.new
            traslado.from_hash t
            concepto.impuestos.traslados << traslado
          end
          c[:impuestos][:retenciones].each do |r|
            retencion = Cofidin33::RetencionConcepto.new
            retencion.from_hash r
            concepto.impuestos.retenciones << retencion
          end
        end
        comprobante.conceptos << concepto
      end
      if hash[:tipo_de_comprobante] != 'P'
        comprobante.impuestos.from_hash hash[:impuestos]
        hash[:impuestos][:traslados].each do |t|
          traslado = Cofidin33::TrasladoComprobante.new
          traslado.from_hash t
          comprobante.impuestos.traslados << traslado
        end
      else
        hash[:complemento][:pagos].each do |p|
          pago = Cofidin33::Pago.new
          pago.from_hash p
          p[:docto_relacionado].each do |d|
            doc = Cofidin33::PagoDocRelacionado.new
            doc.from_hash d
            pago.documentos_relacionados << doc
          end
          comprobante.pagos << pago
        end
      end
      comprobante
    end
  end
end
