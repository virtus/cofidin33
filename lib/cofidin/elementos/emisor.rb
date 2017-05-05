module Cofidin
  class Emisor
    attr_accessor :rfc
    attr_accessor :nombre
    attr_accessor :regimen_fiscal

    def atributos_sat
      datos = {}
      datos[:Rfc] = rfc
      datos[:Nombre] = nombre if nombre
      datos[:RegimenFiscal] = regimen_fiscal
      datos
    end

    def from_hash(params)
      @rfc = params[:rfc]
      @nombre = params[:nombre]
      @regimen_fiscal = params[:regimen_fiscal]
    end

    def cadena_original
      campos_cadena = [
        :rfc,
        :nombre,
        :regimen_fiscal
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
