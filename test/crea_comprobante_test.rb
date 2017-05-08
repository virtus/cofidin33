require 'test_helper'
require 'fixtures/comprobante_prueba'

class CreaComprobanteTest < Minitest::Spec
  it 'crea un comprobante a partir de un hash' do
    comprobante = Cofidin33::CreaComprobante.call(COMPROBANTE_PRUEBA)
    comprobante.must_be_instance_of Cofidin33::Comprobante
    comprobante.emisor.must_be_instance_of Cofidin33::Emisor
    comprobante.receptor.must_be_instance_of Cofidin33::Receptor
    comprobante.conceptos.length.must_equal 2
    comprobante.conceptos[0].must_be_instance_of Cofidin33::Concepto
    comprobante.impuestos.must_be_instance_of Cofidin33::ImpuestosComprobante
    comprobante.impuestos.traslados[0].must_be_instance_of Cofidin33::TrasladoComprobante
  end
end
