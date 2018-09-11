module Cofidin33
  class PagoDocRelacionado
    attr_accessor :id_documento
    attr_accessor :serie
    attr_accessor :folio
    attr_accessor :moneda
    attr_accessor :metodo_pago
    attr_accessor :num_parcialidad
    attr_accessor :imp_saldo_ant
    attr_accessor :imp_pagado
    attr_accessor :imp_saldo_insoluto

    def atributos_sat
      datos = {}
      datos[:IdDocumento] = id_documento
      datos[:Serie] = serie
      datos[:Folio] = folio
      datos[:MonedaDR] = moneda
      datos[:MetodoDePagoDR] = metodo_pago
      datos[:NumParcialidad] = num_parcialidad
      datos[:ImpSaldoAnt] = imp_saldo_ant
      datos[:ImpPagado] = imp_pagado
      datos[:ImpSaldoInsoluto] = imp_saldo_insoluto
      datos
    end

    def from_hash(params)
      @id_documento = params[:id_documento]
      @serie = params[:serie]
      @folio = params[:folio]
      @moneda = params[:moneda]
      @metodo_pago = params[:metodo_pago]
      @num_parcialidad = params[:num_parcialidad]
      @imp_saldo_ant = params[:imp_saldo_ant]
      @imp_pagado = params[:imp_pagado]
      @imp_saldo_insoluto = params[:imp_saldo_insoluto]
    end

    def cadena_original
      campos_cadena = [
        :id_documento,
        :serie,
        :folio,
        :moneda,
        :metodo_pago,
        :num_parcialidad,
        :imp_saldo_ant,
        :imp_pagado,
        :imp_saldo_insoluto
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
