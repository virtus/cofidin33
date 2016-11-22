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

    def initialize
      self.version = '3.2'
      self.emisor = Cofidin::Emisor.new
      self.receptor = Cofidin::Receptor.new
    end

    def atributos
      {
        'xmlns:cfdi' => 'http://www.sat.gob.mx/cfd/3',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'xsi:schemaLocation' => 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd',
        version: version,
        serie: serie,
        folio: folio,
        fecha: fecha,
        sello: sello,
        formaDePago: forma_de_pago,
        noCertificado: no_certificado,
        certificado: certificado,
        condicionesDePago: condiciones_de_pago,
        subTotal: sub_total,
        descuento: descuento,
        motivoDescuento: motivo_descuento,
        TipoCambio: tipo_cambio,
        Moneda: moneda,
        total: total,
        tipoDeComprobante: tipo_de_comprobante,
        metodoDePago: metodo_de_pago,
        LugarExpedicion: lugar_expedicion,
        NumCtaPago: num_cta_pago,
        FolioFiscalOrig: folio_fiscal_orig,
        SerieFolioFiscalOrig: serie_folio_fiscal_orig,
        FechaFolioFiscalOrig: fecha_folio_fiscal_orig,
        MontoFolioFiscalOrig: monto_folio_fiscal_orig
      }
    end
  end
end
