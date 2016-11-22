require 'nokogiri'

module Cofidin
  class Serializer
    def serialize(comprobante)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml['cfdi'].Comprobante(comprobante.atributos) do
          xml.Emisor(comprobante.emisor.atributos) do
            xml.DomicilioFiscal(comprobante.emisor.domicilio_fiscal.atributos)
          end
          xml.Receptor(comprobante.receptor.atributos) do
            xml.Domicilio(comprobante.receptor.domicilio.atributos)
          end
          xml.Conceptos do
            comprobante.conceptos.each do |concepto|
              xml.Concepto(concepto.atributos)
            end
          end
          xml.Impuestos(comprobante.impuestos.atributos) do
            xml.Retenciones do
              comprobante.impuestos.retenciones.each do |retencion|
                xml.Retencion(retencion.atributos)
              end
            end
            xml.Traslados do
              comprobante.impuestos.traslados.each do |traslado|
                xml.Traslado(traslado.atributos)
              end
            end
          end
          xml.Complemento
          xml.Addenda
        end
      end

      builder.to_xml
    end
  end
end
