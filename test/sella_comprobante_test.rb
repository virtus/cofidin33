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
    fecha_hora = Time.now.iso8601[0..18]
    xml = Cofidin33::SellaComprobante.call @comprobante, certificado, llave_privada, fecha_hora
    doc = Nokogiri::XML(xml)
    node = doc.at_css "cfdi|Comprobante"
    node.attribute('Fecha').value.must_equal fecha_hora
    node.attribute('NoCertificado').value.must_equal '20001000000200001428'
    node.attribute('Certificado').value.wont_equal ''
    node.attribute('Sello').value.wont_equal ''
  end
end
