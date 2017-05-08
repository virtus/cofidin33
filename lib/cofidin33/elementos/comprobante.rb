module Cofidin33
  class Comprobante
    attr_accessor :version
    attr_accessor :serie
    attr_accessor :folio
    attr_accessor :fecha
    attr_accessor :sello
    attr_accessor :forma_pago
    attr_accessor :no_certificado
    attr_accessor :certificado
    attr_accessor :condiciones_de_pago
    attr_accessor :sub_total
    attr_accessor :descuento
    attr_accessor :tipo_cambio
    attr_accessor :moneda
    attr_accessor :total
    attr_accessor :tipo_de_comprobante
    attr_accessor :metodo_pago
    attr_accessor :lugar_expedicion
    attr_accessor :confirmacion

    attr_accessor :emisor
    attr_accessor :receptor
    attr_accessor :conceptos
    attr_accessor :impuestos

    def initialize
      self.version = '3.3'
      self.emisor = Cofidin33::Emisor.new
      self.receptor = Cofidin33::Receptor.new
      self.conceptos = []
      self.impuestos = Cofidin33::ImpuestosComprobante.new
    end

    def atributos_sat
      datos = {}
      datos['xmlns:cfdi'] = 'http://www.sat.gob.mx/cfd/3'
      datos['xmlns:xsi'] = 'http://www.w3.org/2001/XMLSchema-instance'
      datos['xsi:schemaLocation'] = 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv33.xsd'
      datos[:Version] = version
      datos[:Serie] = serie if serie
      datos[:Folio] = folio if folio
      datos[:Fecha] = fecha
      datos[:Sello] = sello
      datos[:FormaPago] = forma_pago
      datos[:NoCertificado] = no_certificado
      datos[:Certificado] = certificado
      datos[:CondicionesDePago] = condiciones_de_pago if condiciones_de_pago
      datos[:SubTotal] = sub_total
      datos[:Descuento] = descuento if descuento
      datos[:Moneda] = moneda if moneda
      datos[:TipoCambio] = tipo_cambio if tipo_cambio
      datos[:Total] = total
      datos[:TipoDeComprobante] = tipo_de_comprobante
      datos[:MetodoPago] = metodo_pago
      datos[:LugarExpedicion] = lugar_expedicion
      datos[:Confirmacion] = confirmacion if confirmacion
      datos
    end

    def from_hash(params)
      @serie = params[:serie]
      @folio = params[:folio]
      @fecha = params[:fecha]
      @sello = params[:sello]
      @forma_pago = params[:forma_pago]
      @no_certificado = params[:no_certificado]
      @certificado = params[:certificado]
      @condiciones_de_pago = params[:condiciones_de_pago]
      @sub_total = params[:sub_total]
      @descuento = params[:descuento]
      @moneda = params[:moneda]
      @tipo_cambio = params[:tipo_cambio]
      @total = params[:total]
      @tipo_de_comprobante = params[:tipo_de_comprobante]
      @metodo_pago = params[:metodo_pago]
      @lugar_expedicion = params[:lugar_expedicion]
      @confirmacion = params[:confirmacion]
    end

    def cadena_original
      campos_cadena = [
        :version,
        :serie,
        :folio,
        :fecha,
        :forma_pago,
        :no_certificado,
        :condiciones_de_pago,
        :sub_total,
        :descuento,
        :moneda,
        :tipo_cambio,
        :total,
        :tipo_de_comprobante,
        :metodo_pago,
        :lugar_expedicion,
        :confirmacion
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
