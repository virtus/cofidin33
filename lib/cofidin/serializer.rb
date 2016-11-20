require 'nokogiri'

module Cofidin
  class Serializer
    def serialize(comprobante)
      namespaces = {
        'xmlns:cfdi' => 'http://www.sat.gob.mx/cfd/3',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'xsi:schemaLocation' => 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd'
      }

      builder = Nokogiri::XML::Builder.new do |xml|
        xml['cfdi'].Comprobante(namespaces) do
          # xml.tenderlove
        end
      end

      builder.to_xml
    end
  end
end
