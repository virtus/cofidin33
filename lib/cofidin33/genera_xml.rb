require 'nokogiri'

module Cofidin33
  class GeneraXml
    def self.call(comprobante)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml['cfdi'].Comprobante(comprobante.atributos_sat) do
          xml.Emisor(comprobante.emisor.atributos_sat)
          xml.Receptor(comprobante.receptor.atributos_sat)
          xml.Conceptos do
            comprobante.conceptos.each do |concepto|
              xml.Concepto(concepto.atributos_sat) do
                if(concepto.impuestos.traslados.length + concepto.impuestos.traslados.length) > 0
                  xml.Impuestos do
                    if concepto.impuestos.traslados.length > 0
                      xml.Traslados do
                        concepto.impuestos.traslados.each do |traslado|
                          xml.Traslado(traslado.atributos_sat)
                        end
                      end
                    end
                    if concepto.impuestos.retenciones.length > 0
                      xml.Retenciones do
                        concepto.impuestos.retenciones.each do |retencion|
                          xml.Retencion(retencion.atributos_sat)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          if comprobante.tipo_de_comprobante != 'P'
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
          end
          if comprobante.tipo_de_comprobante != 'P'
            xml.Complemento
          else
            xml.Complemento do
              xml['pago10'].Pagos('Version' => '1.0', 'xmlns:pago10' => 'http://www.sat.gob.mx/Pagos') do
                comprobante.pagos.each do |pago|
                  xml.Pago(pago.atributos_sat) do
                    pago.documentos_relacionados.each do |doc|
                      xml.DoctoRelacionado(doc.atributos_sat)
                    end
                  end
                end
              end
            end
          end
        end
      end

      builder.to_xml(encoding: 'UTF-8')
    end
  end
end
