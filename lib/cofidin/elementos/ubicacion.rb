module Cofidin
  class Ubicacion
    attr_accessor :calle
    attr_accessor :no_exterior
    attr_accessor :no_interior
    attr_accessor :colonia
    attr_accessor :localidad
    attr_accessor :referencia
    attr_accessor :municipio
    attr_accessor :estado
    attr_accessor :pais
    attr_accessor :codigo_postal

    def atributos_sat
      datos = {}
      datos[:calle] = calle
      datos[:noExterior] = no_exterior if no_exterior
      datos[:noInterior] = no_interior if no_interior
      datos[:colonia] = colonia if colonia
      datos[:localidad] = localidad if localidad
      datos[:referencia] = referencia if referencia
      datos[:municipio] = municipio
      datos[:estado] = estado
      datos[:pais] = pais
      datos[:codigoPostal] = codigo_postal
      datos
    end

    def atributos_sat=(params)
      self.calle = params[:calle]
      self.no_exterior = params[:noExterior]
      self.no_interior = params[:noInterior]
      self.colonia = params[:colonia]
      self.localidad = params[:localidad]
      self.referencia = params[:referencia]
      self.municipio = params[:municipio]
      self.estado = params[:estado]
      self.pais = params[:pais]
      self.codigo_postal = params[:codigoPostal]
    end

    def from_hash(params)
      @calle = params[:calle]
      @no_exterior = params[:no_exterior]
      @no_interior = params[:no_interior]
      @colonia = params[:colonia]
      @localidad = params[:localidad]
      @referencia = params[:referencia]
      @municipio = params[:municipio]
      @estado = params[:estado]
      @pais = params[:pais]
      @codigo_postal = params[:codigo_postal]
    end

    def cadena_original
      campos_cadena = [
        :calle,
        :no_exterior,
        :no_interior,
        :colonia,
        :localidad,
        :referencia,
        :municipio,
        :estado,
        :pais,
        :codigo_postal
      ]

      campos_con_datos = campos_cadena.select { |campo| self.send(campo) }
      campos_con_datos.map { |campo| self.send(campo) }.join '|'
    end
  end
end
