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

    def atributos_sat
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

    def atributos_sat=(params)
      self.serie = params[:serie]
      self.folio = params[:folio]
      self.fecha = params[:fecha]
      self.sello = params[:sello]
      self.forma_de_pago = params[:formaDePago]
      self.no_certificado = params[:noCertificado]
      self.certificado = params[:certificado]
      self.condiciones_de_pago = params[:condicionesDePago]
      self.sub_total = params[:subTotal]
      self.descuento = params[:descuento]
      self.motivo_descuento = params[:motivoDescuento]
      self.tipo_cambio = params[:TipoCambio]
      self.moneda = params[:Moneda]
      self.total = params[:total]
      self.tipo_de_comprobante = params[:tipoDeComprobante]
      self.metodo_de_pago = params[:metodoDePago]
      self.lugar_expedicion = params[:LugarExpedicion]
      self.num_cta_pago = params[:NumCtaPago]
      self.folio_fiscal_orig = params[:FolioFiscalOrig]
      self.serie_folio_fiscal_orig = params[:SerieFolioFiscalOrig]
      self.fecha_folio_fiscal_orig = params[:FechaFolioFiscalOrig]
      self.monto_folio_fiscal_orig = params[:MontoFolioFiscalOrig]
    end

    def from_hash(params)
      @serie = params[:serie]
      @folio = params[:folio]
      @fecha = params[:fecha]
      @sello = params[:sello]
      @forma_de_pago = params[:forma_de_pago]
      @no_certificado = params[:no_certificado]
      @certificado = params[:certificado]
      @condiciones_de_pago = params[:condiciones_de_pago]
      @sub_total = params[:sub_total]
      @descuento = params[:descuento]
      @motivo_descuento = params[:motivo_descuento]
      @tipo_cambio = params[:tipo_cambio]
      @moneda = params[:moneda]
      @total = params[:total]
      @tipo_de_comprobante = params[:tipo_de_comprobante]
      @metodo_de_pago = params[:metodo_de_pago]
      @lugar_expedicion = params[:lugar_expedicion]
      @num_cta_pago = params[:num_cta_pago]
      @folio_fiscal_orig = params[:folio_fiscal_orig]
      @serie_folio_fiscal_orig = params[:serie_folio_fiscal_orig]
      @fecha_folio_fiscal_orig = params[:fecha_folio_fiscal_orig]
      @monto_folio_fiscal_orig = params[:monto_folio_fiscal_orig]
    end

    def cadena_original
      campos_cadena = [
        :version,
        :fecha,
        :tipo_de_comprobante,
        :forma_de_pago,
        :condiciones_de_pago,
        :sub_total,
        :descuento,
        :tipo_cambio,
        :moneda,
        :total,
        :metodo_de_pago,
        :lugar_expedicion,
        :num_cta_pago,
        :folio_fiscal_orig,
        :serie_folio_fiscal_orig,
        :fecha_folio_fiscal_orig,
        :monto_folio_fiscal_orig
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
