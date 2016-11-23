require 'test_helper'

class DomicilioFiscalTest < Minitest::Spec
  it 'test_valida' do
    domicilio_fiscal = Cofidin::DomicilioFiscal.new
    result = domicilio_fiscal.valida({ calle: 'x', casa: 'b' })
    result.success?.must_equal false
  end
end
