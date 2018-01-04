require 'test_helper'

class ComprobanteTest < Minitest::Spec
  before do
    @datos_comprobante = {
      serie: 'A',
      folio: '1',
      fecha: '2016-12-15T17:31:46',
      sello: 'SELLO',
      forma_pago: 'Pago en una sola exhibición',
      no_certificado: '123456',
      certificado: 'CERTIFICADO',
      condiciones_de_pago: 'Contra entrega',
      sub_total: '10.00',
      descuento: '0.00',
      moneda: 'MXN',
      tipo_cambio: '1.0000',
      total: '11.60',
      tipo_de_comprobante: 'ingreso',
      metodo_pago: '03',
      lugar_expedicion: '53050',
      confirmacion: '234567'
    }
  end

  it 'genera la cadena original' do
    comprobante = Cofidin33::Comprobante.new
    comprobante.from_hash @datos_comprobante
    cadena = comprobante.cadena_original
    cadena.must_equal '3.3|A|1|2016-12-15T17:31:46|Pago en una sola exhibición|123456|Contra entrega|10.00|0.00|MXN|1.0000|11.60|ingreso|03|53050|234567'
  end
end
