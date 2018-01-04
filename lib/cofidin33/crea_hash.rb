module Cofidin33
  class CreaHash
    def self.call(xml:)
      doc = Nokogiri.XML(xml)
      node = doc.at_css ":root"
      if node.name != "Comprobante"
        return [:error, "El documento no es un CFDI"]
      end
      comprobante_xml = doc.at_css 'cfdi|Comprobante'
      emisor_xml = doc.at_css 'cfdi|Comprobante > cfdi|Emisor'
      receptor_xml = doc.at_css 'cfdi|Comprobante > cfdi|Receptor'
      conceptos_xml = doc.css 'cfdi|Comprobante > cfdi|Conceptos > cfdi|Concepto'
      impuestos_xml = doc.at_css 'cfdi|Comprobante > cfdi|Impuestos'
      retenciones_xml = doc.css 'cfdi|Comprobante > cfdi|Impuestos > cfdi|Retenciones > cfdi|Retencion'
      traslados_xml = doc.css 'cfdi|Comprobante > cfdi|Impuestos > cfdi|Traslados > cfdi|Traslado'
      complemento = doc.at_css 'cfdi|Comprobante > cfdi|Complemento'
      timbre_fiscal = complemento.xpath('timbre:TimbreFiscalDigital', 'timbre' => 'http://www.sat.gob.mx/TimbreFiscalDigital').first

      invoice_hash = {
        version: comprobante_xml['Version'],
        serie: comprobante_xml['Serie'],
        folio: comprobante_xml['Folio'],
        fecha: comprobante_xml['Fecha'],
        sello: comprobante_xml['Sello'],
        forma_pago: comprobante_xml['FormaPago'],
        no_certificado: comprobante_xml['NoCertificado'],
        certificado: comprobante_xml['Certificado'],
        condiciones_de_pago: comprobante_xml['CondicionesDePago'],
        sub_total: comprobante_xml['SubTotal'],
        descuento: comprobante_xml['Descuento'],
        moneda: comprobante_xml['Moneda'],
        tipo_cambio: comprobante_xml['TipoCambio'],
        total: comprobante_xml['Total'],
        tipo_de_comprobante: comprobante_xml['TipoDeComprobante'],
        metodo_pago: comprobante_xml['MetodoPago'],
        lugar_expedicion: comprobante_xml['LugarExpedicion'],
        confirmacion: comprobante_xml['Confirmacion'],
        cfdi_relacionados: [],
        emisor: {
          rfc: emisor_xml['Rfc'],
          nombre: emisor_xml['Nombre'],
          regimen_fiscal: emisor_xml['RegimenFiscal']
        },
        receptor: {
          rfc: receptor_xml['Rfc'],
          nombre: receptor_xml['Nombre'],
          residencia_fiscal: receptor_xml['ResidenciaFiscal'],
          num_reg_id_trib: receptor_xml['NumRegIdTrib'],
          uso_cfdi: receptor_xml['UsoCFDI']
        },
        conceptos: [],
        impuestos: {
          total_impuestos_retenidos: impuestos_xml['TotalImpuestosRetenidos'],
          total_impuestos_trasladados: impuestos_xml['TotalImpuestosTrasladados'],
          retenciones: [],
          traslados: []
        },
        complemento: {
          timbre_fiscal: {
            version: timbre_fiscal['Version'],
            uuid: timbre_fiscal['UUID'],
            fecha_timbrado: timbre_fiscal['FechaTimbrado'],
            sello_cfd: timbre_fiscal['SelloCFD'],
            no_certificado_sat: timbre_fiscal['NoCertificadoSAT'],
            sello_sat: timbre_fiscal['SelloSAT'],
          }
        }
      }
      conceptos_xml.each do |concepto_xml|
        concepto = {
          clave_prod_serv: concepto_xml['ClaveProdServ'],
          no_identificacion: concepto_xml['NoIdentificacion'],
          cantidad: concepto_xml['Cantidad'],
          clave_unidad: concepto_xml['ClaveUnidad'],
          unidad: concepto_xml['Unidad'],
          descripcion: concepto_xml['Descripcion'],
          valor_unitario: concepto_xml['ValorUnitario'],
          importe: concepto_xml['Importe'],
          descuento: concepto_xml['Descuento'],
          impuestos: {
            traslados: [],
            retenciones: []
          }
        }

        traslados_xml = concepto_xml.css('cfdi|Impuestos > cfdi|Traslados > cfdi|Traslado')
        unless traslados_xml.nil?
          traslados_xml.each do |traslado_xml|
            concepto[:impuestos][:traslados] << {
              base: traslado_xml['Base'],
              impuesto: traslado_xml['Impuesto'],
              tipo_factor: traslado_xml['TipoFactor'],
              tasa_cuota: traslado_xml['TasaOCuota'],
              importe: traslado_xml['Importe']
            }
          end
        end

        retenciones_xml = concepto_xml.css('cfdi|Impuestos > cfdi|Retenciones > cfdi|Retencion')
        unless retenciones_xml.nil?
          retenciones_xml.each do |retencion_xml|
            concepto[:impuestos][:retenciones] << {
              base: retencion_xml['Base'],
              impuesto: retencion_xml['Impuesto'],
              tipo_factor: retencion_xml['TipoFactor'],
              tasa_cuota: retencion_xml['TasaOCuota'],
              importe: retencion_xml['Importe']
            }
          end
        end
        invoice_hash[:conceptos] << concepto
      end

      retenciones_xml.each do |retencion_xml|
        invoice_hash[:impuestos][:retenciones] << {
          tipo: 'RETENCION',
          impuesto: retencion_xml['Impuesto'],
          importe: retencion_xml['Importe']
        }
      end

      traslados_xml.each do |traslado_xml|
        invoice_hash[:impuestos][:traslados] << {
          tipo: 'TRASLADO',
          impuesto: traslado_xml['Impuesto'],
          tipo_factor: traslado_xml['TipoFactor'],
          tasa_cuota: traslado_xml['TasaOCuota'],
          importe: traslado_xml['Importe']
        }
      end

      [:ok, invoice_hash]
    end
  end
end