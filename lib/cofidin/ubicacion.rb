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

    def atributos
      {
        calle: calle,
        noExterior: no_exterior,
        noInterior: no_interior,
        colonia: colonia,
        localidad: localidad,
        referencia: referencia,
        municipio: municipio,
        estado: estado,
        pais: pais,
        codigoPostal: codigo_postal
      }
    end

    def atributos=(params)
      self.calle = params[:calle]
      self.no_exterior = params[:no_exterior]
      self.no_interior = params[:no_interior]
      self.colonia = params[:colonia]
      self.localidad = params[:localidad]
      self.referencia = params[:referencia]
      self.municipio = params[:municipio]
      self.estado = params[:estado]
      self.pais = params[:pais]
      self.codigo_postal = params[:codigo_postal]
    end
  end
end
