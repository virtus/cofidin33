require 'test_helper'
require 'fixtures/comprobante_prueba'
require 'fixtures/recibo_pago'

class CreaComprobanteTest < Minitest::Spec
  it 'crea un comprobante a partir de un hash' do
    comprobante = Cofidin33::CreaComprobante.call(hash: COMPROBANTE_PRUEBA)
    comprobante.must_be_instance_of Cofidin33::Comprobante
    comprobante.emisor.must_be_instance_of Cofidin33::Emisor
    comprobante.receptor.must_be_instance_of Cofidin33::Receptor
    comprobante.conceptos.length.must_equal 2
    comprobante.conceptos[0].must_be_instance_of Cofidin33::Concepto
    comprobante.impuestos.must_be_instance_of Cofidin33::ImpuestosComprobante
    comprobante.impuestos.traslados[0].must_be_instance_of Cofidin33::TrasladoComprobante
  end

  it 'crea un recibo de pago a partir de un hash' do
    comprobante = Cofidin33::CreaComprobante.call(hash: RECIBO_PAGO)
    comprobante.must_be_instance_of Cofidin33::Comprobante
    comprobante.emisor.must_be_instance_of Cofidin33::Emisor
    comprobante.receptor.must_be_instance_of Cofidin33::Receptor
    comprobante.conceptos.length.must_equal 1
    comprobante.conceptos[0].must_be_instance_of Cofidin33::Concepto
    comprobante.pagos[0].must_be_instance_of Cofidin33::Pago
    comprobante.pagos[0].documentos_relacionados[0].must_be_instance_of Cofidin33::PagoDocRelacionado
  end
end
