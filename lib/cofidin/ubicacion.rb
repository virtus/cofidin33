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
  end
end
