require 'test_helper'
require 'fixtures/comprobante_prueba'
require 'time'

class SellaComprobanteTest < Minitest::Spec
  before do
    @comprobante = Cofidin33::CreaComprobante.call(COMPROBANTE_PRUEBA)
    @comprobante.fecha = nil
    @comprobante.no_certificado = nil
    @comprobante.certificado = nil
    @comprobante.sello = nil
  end

  it 'sella el comprobante' do
    certificado = File.read('test/certificados/CSD01_AAA010101AAA.cer')
    llave_privada = File.read('test/certificados/CSD01_AAA010101AAA.pem')
    fecha_hora = Time.now.iso8601
    xml = Cofidin33::SellaComprobante.call @comprobante, certificado, llave_privada, fecha_hora
    doc = Nokogiri::XML(xml)
    node = doc.at_css "cfdi|Comprobante"
    node.attribute('fecha').value.must_equal fecha_hora
    node.attribute('noCertificado').value.must_equal '20001000000200001428'
    node.attribute('certificado').value.wont_equal ''
    node.attribute('sello').value.wont_equal ''
  end
end
