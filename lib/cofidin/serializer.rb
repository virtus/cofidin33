require 'nokogiri'

module Cofidin
  class Serializer
    def serialize(comprobante)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml['cfdi'].Comprobante(comprobante.atributos) do
        end
      end

      builder.to_xml
    end
  end
end
