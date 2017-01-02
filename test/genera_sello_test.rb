require 'test_helper'

class GeneraSelloTest < Minitest::Spec
  before do
    @cadena_original = '||3.2|2013-12-02T22:18:24|ingreso|PAGO EN UNA SOLA EXHIBICION|1000.00|1160.00|TRANSFERENCIA ELECTRONICA|D.F.,MEXICO|DESCONOCIDO|AAA010101AAA|EMPRESA DEMO|REFORMA|BENITO JUAREZ|DISTRITO FEDERAL|MEXICO|34343|PERSONA FISCA|XAXX010101000|PUBLICO EN GENERAL|INSURGENTES|MEXICO|1|CANT|PZA|1000.00|1000.00|IVA|160.00|160.00||'
    @sello_esperado  = "J3gqqX75OpgU+/P3JvT7n74khv4hlqLdmiBbaEH7vT4RyZ3L9UPpPv0W3ABWYVljMCtQQGgMkj2soq/kXNayUWvU7jmZVzr2z2IgL8xnhqTgkNP03SlMdHJutdKiWyebJhCaFDw+MP+4RAzqwlsSM7bA9CnfUYUBcjFFyP/s4+w="
  end

  it 'genera el sello a partir de la cadena original' do
    llave_privada = File.read('test/certificados/CSD01_AAA010101AAA.pem')
    sello_digital = Cofidin::GeneraSello.call @cadena_original, llave_privada
    sello_digital.must_equal @sello_esperado
  end

  it 'el sello es diferente si cambia la cadena original' do
    llave_privada = File.read('test/certificados/CSD01_AAA010101AAA.pem')
    @cadena_original[4] = '3'
    sello_digital = Cofidin::GeneraSello.call @cadena_original, llave_privada
    sello_digital.wont_equal @sello_esperado
  end

  it 'el sello es diferente si cambia la llave privada' do
    llave_privada = File.read('test/certificados/CSD02_AAA010101AAA.pem')
    sello_digital = Cofidin::GeneraSello.call @cadena_original, llave_privada
    sello_digital.wont_equal @sello_esperado
  end
end
