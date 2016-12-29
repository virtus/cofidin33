module Cofidin
  class RegimenFiscal
    attr_accessor :regimen

    def atributos_sat
      datos = {}
      datos[:Regimen] = regimen
      datos
    end

    def atributos_sat=(params)
      self.regimen = params[:Regimen]
    end

    def cadena_original
      campos_cadena = [
        :regimen
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
