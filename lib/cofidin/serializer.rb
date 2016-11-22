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
          xml.Conceptos
          xml.Impuestos
          xml.Complemento
          xml.Addenda
        end
      end

      builder.to_xml
    end
  end
end
