module Cofidin
  class CreaComprobante
    def self.call(params)
      comprobante = Cofidin::Comprobante.new
      comprobante.from_hash params
      comprobante.emisor.from_hash params[:emisor]
      comprobante.receptor.from_hash params[:receptor]
      params[:conceptos].each do |c|
        concepto = Cofidin::Concepto.new
        concepto.from_hash c
        comprobante.conceptos << concepto
      end
      comprobante.impuestos.from_hash params[:impuestos]
      params[:impuestos][:traslados].each do |t|
        traslado = Cofidin::Traslado.new
        traslado.from_hash t
        comprobante.impuestos.traslados << traslado
      end
      comprobante
    end
  end
end
