require 'test_helper'

class EmisorTest < Minitest::Spec
  before do
    emisor = {
      rfc: 'VCO980224GM7',
      nombre: 'Virtus Consultores, S.A. de C.V.'
    }

    domicilio_emisor = {
      calle: 'Valle de Solís',
      no_exterior: '33',
      colonia: 'El Mirador',
      codigo_postal: '53050',
      municipio: 'Naucalpan',
      estado: 'México',
      pais: 'México'
    }

    @comprobante = Cofidin::Comprobante.new
    @comprobante.emisor.atributos = emisor
    @comprobante.emisor.domicilio_fiscal.atributos = domicilio_emisor
    xml = Cofidin::Serializer.new.serialize @comprobante
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

  describe 'DomicilioFiscal' do
    it 'tiene un atributo calle' do
      @domicilio_fiscal.attributes['calle'].value.must_equal 'Valle de Solís'
    end

    it 'tiene un atributo municipio' do
      @domicilio_fiscal.attributes['municipio'].value.must_equal 'Naucalpan'
    end

    it 'tiene un atributo estado' do
      @domicilio_fiscal.attributes['estado'].value.must_equal 'México'
    end

    it 'tiene un atributo país' do
      @domicilio_fiscal.attributes['pais'].value.must_equal 'México'
    end

    it 'tiene un atributo codigoPostal' do
      @domicilio_fiscal.attributes['codigoPostal'].value.must_equal '53050'
    end
  end
end
