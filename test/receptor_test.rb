require 'test_helper'

class ReceptorTest < Minitest::Spec
  before do
    @datos_receptor = {
      rfc: 'FTV961129GP7',
      nombre: 'Ferrocarril y Terminal del Valle de México, S.A. de C.V.',
      residencia_fiscal: 'MX',
      num_reg_id_trib: 'NRIT',
      uso_cfdi: 'UC'
    }
  end

  describe 'cadena original' do
    it 'genera' do
      receptor = Cofidin::Receptor.new
      receptor.from_hash @datos_receptor
      cadena = receptor.cadena_original
      cadena.must_equal 'FTV961129GP7|Ferrocarril y Terminal del Valle de México, S.A. de C.V.|MX|NRIT|UC'
    end
  end
end
