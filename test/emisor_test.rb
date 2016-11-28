require 'test_helper'

class EmisorTest < Minitest::Spec
  before do
    emisor = {
      rfc: 'VCO980224GM7',
      nombre: 'Virtus Consultores, S.A. de C.V.'
    }

    @comprobante = Cofidin::Comprobante.new
    @comprobante.emisor.atributos = emisor
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    @emisor = doc.at_css "cfdi|Emisor"
  end

  it 'el Emisor tiene un atributo rfc' do
    @emisor.attributes['rfc'].name.must_equal 'rfc'
    @emisor.attributes['rfc'].value.must_equal 'VCO980224GM7'
  end

  it 'el Emisor tiene un atributo nombre' do
    @emisor.attributes['nombre'].name.must_equal 'nombre'
    @emisor.attributes['nombre'].value.must_equal 'Virtus Consultores, S.A. de C.V.'
  end
end
