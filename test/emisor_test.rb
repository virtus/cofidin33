require 'test_helper'

class EmisorTest < Minitest::Spec
  before do
    @datos_emisor = {
      rfc: 'VCO980224GM7',
      nombre: 'Virtus Consultores, S.A. de C.V.',
      regimen_fiscal: 'Régimen general de personas morales'
    }
  end

  describe 'cadena original' do
    it 'genera' do
      emisor = Cofidin::Emisor.new
      emisor.from_hash @datos_emisor
      cadena = emisor.cadena_original
      cadena.must_equal 'VCO980224GM7|Virtus Consultores, S.A. de C.V.|Régimen general de personas morales'
    end
  end
end
