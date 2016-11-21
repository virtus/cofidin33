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

    def initializer
      version = '3.2'
    end
  end
end
