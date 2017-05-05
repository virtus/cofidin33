require 'test_helper'

class EmisorTest < Minitest::Spec
  before do
    @atributos_emisor = {
      rfc: 'VCO980224GM7',
      nombre: 'Virtus Consultores, S.A. de C.V.'
    }

    @comprobante = Cofidin::Comprobante.new
    @comprobante.emisor.atributos_sat = @atributos_emisor
    xml = Cofidin::GeneraXml.call @comprobante
    doc = Nokogiri::XML(xml)
    @emisor = doc.at_css "cfdi|Emisor"
    @domicilio_fiscal = doc.at_css 'cfdi|DomicilioFiscal'
  end

  describe 'Emisor' do
    it 'tiene un atributo rfc' do
      @emisor.attributes['rfc'].value.must_equal 'VCO980224GM7'
    end

    it 'tiene un atributo nombre' do
      @emisor.attributes['nombre'].value.must_equal 'Virtus Consultores, S.A. de C.V.'
    end
  end
  end

  describe 'cadena original' do
    it 'genera' do
      emisor = Cofidin::Emisor.new
      emisor.atributos_sat = @atributos_emisor
      cadena = emisor.cadena_original
      cadena.must_equal 'VCO980224GM7|Virtus Consultores, S.A. de C.V.'
    end
  end
end
