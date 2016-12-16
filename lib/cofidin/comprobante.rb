module Cofidin
  class Comprobante
    attr_accessor :version
    attr_accessor :serie
    attr_accessor :folio
    attr_accessor :fecha
    attr_accessor :sello
    attr_accessor :forma_de_pago
    attr_accessor :no_certificado
    attr_accessor :certificado
    attr_accessor :condiciones_de_pago
    attr_accessor :sub_total
    attr_accessor :descuento
    attr_accessor :motivo_descuento
    attr_accessor :tipo_cambio
    attr_accessor :moneda
    attr_accessor :total
    attr_accessor :tipo_de_comprobante
    attr_accessor :metodo_de_pago
    attr_accessor :lugar_expedicion
    attr_accessor :num_cta_pago
    attr_accessor :folio_fiscal_orig
    attr_accessor :serie_folio_fiscal_orig
    attr_accessor :fecha_folio_fiscal_orig
    attr_accessor :monto_folio_fiscal_orig

    attr_accessor :emisor
    attr_accessor :receptor
    attr_accessor :conceptos
    attr_accessor :impuestos

    def initialize
      self.version = '3.2'
      self.emisor = Cofidin::Emisor.new
      self.receptor = Cofidin::Receptor.new
      self.conceptos = []
      self.impuestos = Cofidin::Impuestos.new
    end

    def atributos
      datos = {}
      datos['xmlns:cfdi'] = 'http://www.sat.gob.mx/cfd/3'
      datos['xmlns:xsi'] = 'http://www.w3.org/2001/XMLSchema-instance'
      datos['xsi:schemaLocation'] = 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd'
      datos[:version] = version
      datos[:serie] = serie if serie
      datos[:folio] = folio if folio
      datos[:fecha] = fecha
      datos[:sello] = sello
      datos[:formaDePago] = forma_de_pago
      datos[:noCertificado] = no_certificado
      datos[:certificado] = certificado
      datos[:condicionesDePago] = condiciones_de_pago if condiciones_de_pago
      datos[:subTotal] = sub_total
      datos[:descuento] = descuento if descuento
      datos[:motivoDescuento] = motivo_descuento if motivo_descuento
      datos[:TipoCambio] = tipo_cambio if tipo_cambio
      datos[:Moneda] = moneda if moneda
      datos[:total] = total
      datos[:tipoDeComprobante] = tipo_de_comprobante
      datos[:metodoDePago] = metodo_de_pago
      datos[:LugarExpedicion] = lugar_expedicion
      datos[:NumCtaPago] = num_cta_pago if num_cta_pago
      datos[:FolioFiscalOrig] = folio_fiscal_orig if folio_fiscal_orig
      datos[:SerieFolioFiscalOrig] = serie_folio_fiscal_orig if serie_folio_fiscal_orig
      datos[:FechaFolioFiscalOrig] = fecha_folio_fiscal_orig if fecha_folio_fiscal_orig
      datos[:MontoFolioFiscalOrig] = monto_folio_fiscal_orig if monto_folio_fiscal_orig
      datos
    end
  end
end
