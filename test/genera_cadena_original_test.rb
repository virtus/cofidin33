require 'test_helper'
require 'crea_comprobante'

class GeneraCadenaOriginalTest < Minitest::Spec
  before do
    @comprobante = CreaComprobante.call
  end

  it 'genera la cadena original' do
    cadena_esperada = "||3.2|2016-12-15T17:31:46|ingreso|Pago en una sola exhibición"\
                      "|10.35|12.00|03|Naucalpan, Estado de México"\
                      "|VCO980224GM7|Virtus Consultores, S.A. de C.V."\
                      "|Valle de Solís|33|El Mirador|Naucalpan|México|México|53050"\
                      "|Régimen general de ley de personal morales"\
                      "|CRM6702109K6|Cruz Roja Mexicana, I.A.P."\
                      "|Juan Luis Vives|2002|A|Los Morales Polanco|Miguel Hidalgo|Ciudad de México|México|11510"\
                      "|1|PIEZA|ABC|Concepto 1|1.23|1.23|2|PIEZA|Concepto 2|9.12"\
                      "|IVA|16.00|1.65|1.65||"


    cadena_original = Cofidin::GeneraCadenaOriginal.call @comprobante
    cadena_original.must_equal cadena_esperada
  end
end
