require 'test_helper'

class UbicacionTest < Minitest::Spec
  before do
    @atributos_ubicacion = {
      calle: 'Valle de Solís',
      noExterior: '33',
      colonia: 'El Mirador',
      municipio: 'Naucalpan',
      estado: 'México',
      pais: 'México',
      codigoPostal: '53050'
    }
  end

  describe 'cadena original' do
    it 'genera' do
      ubicacion = Cofidin::Ubicacion.new
      ubicacion.atributos_sat = @atributos_ubicacion
      cadena = ubicacion.cadena_original
      cadena.must_equal 'Valle de Solís|33|El Mirador|Naucalpan|México|México|53050'
    end
  end
end
