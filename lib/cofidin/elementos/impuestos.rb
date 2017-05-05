module Cofidin
  class Impuestos
    attr_accessor :total_impuestos_retenidos
    attr_accessor :total_impuestos_trasladados

    attr_accessor :retenciones
    attr_accessor :traslados

    def initialize
      self.retenciones = []
      self.traslados = []
    end

    def atributos_sat
      datos = {}
      datos[:TotalImpuestosRetenidos] = total_impuestos_retenidos if total_impuestos_retenidos
      datos[:TotalImpuestosTrasladados] = total_impuestos_trasladados if total_impuestos_trasladados
      datos
    end

    def from_hash(params)
      @total_impuestos_retenidos = params[:total_impuestos_retenidos]
      @total_impuestos_trasladados = params[:total_impuestos_trasladados]
    end

    def cadena_original
      campos_cadena = [
        :total_impuestos_retenidos,
        :total_impuestos_trasladados
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end

  end
end
