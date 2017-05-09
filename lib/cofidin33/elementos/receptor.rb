module Cofidin33
  class Receptor
    attr_accessor :rfc
    attr_accessor :nombre
    attr_accessor :residencia_fiscal
    attr_accessor :num_reg_id_trib
    attr_accessor :uso_cfdi

    def atributos_sat
      datos = {}
      datos[:Rfc] = rfc
      datos[:Nombre] = nombre if nombre
      datos[:ResidenciaFiscal] = residencia_fiscal if residencia_fiscal
      datos[:NumRegIdTrib] = num_reg_id_trib if num_reg_id_trib
      datos[:UsoCFDI] = uso_cfdi if uso_cfdi
      datos
    end

    def from_hash(params)
      @rfc = params[:rfc]
      @nombre = params[:nombre]
      @residencia_fiscal = params[:residencia_fiscal]
      @num_reg_id_trib = params[:num_reg_id_trib]
      @uso_cfdi = params[:uso_cfdi]
    end

    def cadena_original
      campos_cadena = [
        :rfc,
        :nombre,
        :residencia_fiscal,
        :num_reg_id_trib,
        :uso_cfdi
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
