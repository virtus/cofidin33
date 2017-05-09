require 'test_helper'

class GeneraSelloTest < Minitest::Spec
  before do
    @cadena_original = "||3.3|B|1|2016-12-15T17:31:46|03|12345678901234567890|10.35|MXN|12.00|I|PUE|53100"\
                       "|VCO980224GM7|Virtus Consultores, SA de CV|601"\
                       "|CRM6702109K6|Cruz Roja Mexicana, IAP|G01"\
                       "|43231500|1|H87|Concepto 1|1.23|1.23|1.23|002|Tasa|0.160000|0.1968"\
                       "|81111504|2|H87|Concepto 2|4.56|9.12|9.12|002|Tasa|0.160000|1.4592"\
                       "|002|Tasa|0.160000|1.656|1.656||"

    @sello_esperado  = "STvLzmOb7iJvUV6guvh4ag0iiD/u3B5fiY3aEiBUrkw7KH2vlHwU9HPNIqXJ1intQnYC/TYab1ILnSTV+vCAHswRRFsOh58zUogIFY0DP1hbr6rhsoTtYPN9Oc2YTQ/ft3dyWhG4Lc5216DjDlSFjxv18AzC8dRQLtATsvfGcGE="
  end

  it 'genera el sello a partir de la cadena original' do
    llave_privada = File.read('test/certificados/CSD01_AAA010101AAA.pem')
    sello_digital = Cofidin33::GeneraSello.call @cadena_original, llave_privada
    sello_digital.must_equal @sello_esperado
  end

  it 'el sello es diferente si cambia la cadena original' do
    llave_privada = File.read('test/certificados/CSD01_AAA010101AAA.pem')
    @cadena_original[4] = '2'
    sello_digital = Cofidin33::GeneraSello.call @cadena_original, llave_privada
    sello_digital.wont_equal @sello_esperado
  end

  it 'el sello es diferente si cambia la llave privada' do
    llave_privada = File.read('test/certificados/CSD02_AAA010101AAA.pem')
    sello_digital = Cofidin33::GeneraSello.call @cadena_original, llave_privada
    sello_digital.wont_equal @sello_esperado
  end
end
