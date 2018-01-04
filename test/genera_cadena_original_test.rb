require 'test_helper'
require 'fixtures/comprobante_prueba'

class GeneraCadenaOriginalTest < Minitest::Spec
  before do
    @comprobante = Cofidin33::CreaComprobante.call(hash: COMPROBANTE_PRUEBA)
  end

  it 'genera la cadena original' do
    cadena_esperada = "||3.3|B|1|2016-12-15T17:31:46|03|12345678901234567890|10.35|MXN|12.00|I|PUE|53100"\
                      "|VCO980224GM7|Virtus Consultores, SA de CV|601"\
                      "|CRM6702109K6|Cruz Roja Mexicana, IAP|G01"\
                      "|43231500|1|H87|Concepto 1|1.23|1.23|1.23|002|Tasa|0.160000|0.1968"\
                      "|81111504|2|H87|Concepto 2|4.56|9.12|9.12|002|Tasa|0.160000|1.4592"\
                      "|002|Tasa|0.160000|1.656|1.656||"

    cadena_original = Cofidin33::GeneraCadenaOriginal.call @comprobante
    cadena_original.must_equal cadena_esperada
  end
end
