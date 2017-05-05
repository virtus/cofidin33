require 'test_helper'
require 'fixtures/comprobante_prueba'

class GeneraXmlTest < Minitest::Spec
  before do
    @comprobante = Cofidin::CreaComprobante.call(COMPROBANTE_PRUEBA)
    xml = Cofidin::GeneraXml.call @comprobante
    @doc = Nokogiri::XML(xml)
  end

  it 'crea un documento con los namespaces requeridos' do
    namespaces = @doc.namespaces
    namespaces["xmlns:cfdi"].must_equal "http://www.sat.gob.mx/cfd/3"
    namespaces["xmlns:xsi"].must_equal "http://www.w3.org/2001/XMLSchema-instance"
  end

  it 'crea un nodo Comprobante en la raíz del documento' do
    node = @doc.at_css ":root"
    node.name.must_equal "Comprobante"
  end

  it 'crea un nodo Emisor bajo el nodo Comprobante' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Emisor"
    node.name.must_equal "Emisor"
  end

  it 'crea un nodo RegimenFiscal bajo el nodo Emisor' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Emisor > cfdi|RegimenFiscal"
    node.name.must_equal "RegimenFiscal"
  end

  it 'crea un nodo Conceptos bajo el nodo Comprobante' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Conceptos"
    node.name.must_equal "Conceptos"
  end

  it 'crea un nodo Receptor bajo el nodo Comprobante' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Receptor"
    node.name.must_equal "Receptor"
  end

  it 'crea un nodo Conceptos bajo el nodo Comprobante' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Conceptos"
    node.name.must_equal "Conceptos"
  end

  it 'crea los conceptos baja el nodo Concepto' do
    node_set = @doc.css "cfdi|Comprobante > cfdi|Conceptos > cfdi|Concepto"
    node_set.length.must_equal 2
    node_set[0].name.must_equal "Concepto"
    node_set[1].name.must_equal "Concepto"
  end

  it 'crea un nodo Impuestos bajo el nodo Comprobante' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Impuestos"
    node.name.must_equal "Impuestos"
  end

  it 'no crea un nodo Retenciones bajo el nodo Impuestos' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Impuestos > cfdi|Retenciones"
    node.must_be_nil
  end

  it 'crea un nodo Traslados bajo el nodo Impuestos' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Impuestos > cfdi|Traslados"
    node.name.must_equal "Traslados"
  end

  it 'crea un nodo Traslado bajo el nodo Traslados' do
    node_set = @doc.css "cfdi|Comprobante > cfdi|Impuestos > cfdi|Traslados > cfdi|Traslado"
    node_set.length.must_equal 1
    node_set[0].name.must_equal "Traslado"
  end

  it 'crea un nodo Complemento bajo el nodo Comprobante' do
    node = @doc.at_css "cfdi|Comprobante > cfdi|Complemento"
    node.name.must_equal "Complemento"
  end
end
