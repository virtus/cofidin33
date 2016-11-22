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

    def atributos
      {
        totalImpuestosRetenidos: total_impuestos_retenidos,
        totalImpuestosTrasladados: total_impuestos_trasladados
      }
    end
  end
end
