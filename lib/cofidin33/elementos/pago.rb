module Cofidin33
  class Pago
    attr_accessor :fecha_pago
    attr_accessor :forma_pago
    attr_accessor :moneda
    attr_accessor :monto
    attr_accessor :documentos_relacionados

    def initialize
      self.documentos_relacionados = []
    end

    def atributos_sat
      datos = {}
      datos[:FechaPago] = fecha_pago
      datos[:FormaDePagoP] = forma_pago
      datos[:MonedaP] = moneda
      datos[:Monto] = monto
      datos
    end

    def from_hash(params)
      @fecha_pago = params[:fecha_pago]
      @forma_pago = params[:forma_pago]
      @moneda = params[:moneda]
      @monto = params[:monto]
    end

    def cadena_original
      campos_cadena = [
        :fecha_pago,
        :forma_pago,
        :moneda,
        :monto
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
