require 'test_helper'

class PagoTest < Minitest::Spec
  before do
    @datos_pago = {
      fecha_pago: '2018-09-02T12:00:00',
      forma_pago: '03',
      moneda: 'MXN',
      monto: '1234.56'
    }
  end

  describe 'cadena original' do
    it 'genera' do
      pago = Cofidin33::Pago.new
      pago.from_hash @datos_pago
      cadena = pago.cadena_original
      cadena.must_equal '2018-09-02T12:00:00|03|MXN|1234.56'
    end
  end
end
