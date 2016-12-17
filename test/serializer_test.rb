require 'test_helper'

class SeralizerTest < Minitest::Spec
  before do
    @atributos_emisor = {
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

    receptor = {
      rfc: 'CRM6702109K6',
      nombre: 'Cruz Roja Mexicana, I.A.P.'
    }

    domicilio_receptor = {
      calle: 'Juan Luis Vives',
      no_exterior: '2002',
      colonia: 'Los Morales Polanco',
      codigo_postal: '11510',
      municipio: 'Miguel Hidalgo',
      estado: 'Ciudad de México',
      pais: 'México'
    }

    @comprobante = Cofidin::Comprobante.new
    @comprobante.emisor.atributos_sat = @atributos_emisor
    @comprobante.emisor.domicilio_fiscal.atributos_sat = domicilio_emisor
    @comprobante.receptor.atributos = receptor
    @comprobante.receptor.domicilio.atributos_sat = domicilio_receptor
  end

  it 'crea un documento con los namespaces requeridos' do
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    namespaces = doc.namespaces
    namespaces["xmlns:cfdi"].must_equal "http://www.sat.gob.mx/cfd/3"
    namespaces["xmlns:xsi"].must_equal "http://www.w3.org/2001/XMLSchema-instance"
  end

  it 'crea un nodo Comprobante en la raíz del documento' do
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    node = doc.at_css ":root"
    node.name.must_equal "Comprobante"
  end

  it 'crea un nodo Emisor bajo el nodo Comprobante' do
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    node = doc.at_css "cfdi|Comprobante > cfdi|Emisor"
    node.name.must_equal "Emisor"
  end

  it 'crea un nodo Receptor bajo el nodo Comprobante' do
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    node = doc.at_css "cfdi|Comprobante > cfdi|Receptor"
    node.name.must_equal "Receptor"
  end

  it 'crea un nodo Conceptos bajo el nodo Comprobante' do
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    node = doc.at_css "cfdi|Comprobante > cfdi|Conceptos"
    node.name.must_equal "Conceptos"
  end

  it 'crea un nodo Impuestos bajo el nodo Comprobante' do
    xml = Cofidin::Serializer.new.serialize @comprobante
    doc = Nokogiri::XML(xml)
    node = doc.at_css "cfdi|Comprobante > cfdi|Impuestos"
    node.name.must_equal "Impuestos"
  end
end
