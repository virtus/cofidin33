module Cofidin33
  class CreaComprobante
    def self.call(params)
      comprobante = Cofidin33::Comprobante.new
      comprobante.from_hash params
      comprobante.emisor.from_hash params[:emisor]
      comprobante.receptor.from_hash params[:receptor]
      params[:conceptos].each do |c|
        concepto = Cofidin33::Concepto.new
        concepto.from_hash c
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
        comprobante.conceptos << concepto
      end
      comprobante.impuestos.from_hash params[:impuestos]
      params[:impuestos][:traslados].each do |t|
        traslado = Cofidin33::TrasladoComprobante.new
        traslado.from_hash t
        comprobante.impuestos.traslados << traslado
      end
      comprobante
    end
  end
end
