require 'test_helper'

class ComprobanteTest < Minitest::Test
  def test_that_it_generates_xml
    assert true
  end

  def test_1
    domicilio_fiscal = Cofidin::DomicilioFiscal.new
    domicilio_fiscal.atributos = { rfc: 'VCO980224GM7', nombre: 'Virtus Consultores, S.A. de C.V.'}
  end
end
