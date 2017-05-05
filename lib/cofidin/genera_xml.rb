require 'nokogiri'

module Cofidin
  class GeneraXml
    def self.call(comprobante)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml['cfdi'].Comprobante(comprobante.atributos_sat) do
          xml.Emisor(comprobante.emisor.atributos_sat) do
          end
          xml.Receptor(comprobante.receptor.atributos_sat) do
          end
          xml.Conceptos do
            comprobante.conceptos.each do |concepto|
              xml.Concepto(concepto.atributos_sat)
            end
          end
          xml.Impuestos(comprobante.impuestos.atributos_sat) do
            if comprobante.impuestos.retenciones.length > 0
              xml.Retenciones do
                comprobante.impuestos.retenciones.each do |retencion|
                  xml.Retencion(retencion.atributos_sat)
                end
              end
            end
            if comprobante.impuestos.traslados.length > 0
              xml.Traslados do
                comprobante.impuestos.traslados.each do |traslado|
                  xml.Traslado(traslado.atributos_sat)
                end
              end
            end
          end
          xml.Complemento
        end
      end

      builder.to_xml(encoding: 'UTF-8')
    end
  end
end
