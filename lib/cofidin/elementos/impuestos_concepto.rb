module Cofidin
  class ImpuestosConcepto
    attr_accessor :retenciones
    attr_accessor :traslados

    def initialize
      self.retenciones = []
      self.traslados = []
    end

    def atributos_sat
      datos = {}
      datos
    end

    def from_hash(params)
    end

    def cadena_original
      campos_cadena = [
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end

  end
end
