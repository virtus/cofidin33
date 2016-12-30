require 'test_helper'

class GeneraXmlTest < Minitest::Spec
  before do
    atributos_comprobante = {
      serie: 'B',
      folio: '1',
      formaDePago: 'Pago en una sola exhibición',
      SubTotal: '10.35',
      Total: '12.00',
      TipoDeComprobante: 'ingreso',
      MetodoDePago: '03',
      LugarExpedicion: 'Naucalpan, Estado de México'
    }

    atributos_emisor = {
      rfc: 'VCO980224GM7',
      nombre: 'Virtus Consultores, S.A. de C.V.'
    }

    domicilio_emisor = {
      calle: 'Valle de Solís',
      noExterior: '33',
      colonia: 'El Mirador',
      codigoPostal: '53050',
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
      noExterior: '2002',
      noInterior: 'A',
      colonia: 'Los Morales Polanco',
      codigoPostal: '11510',
      municipio: 'Miguel Hidalgo',
      estado: 'Ciudad de México',
      pais: 'México'
    }

    concepto_1 = {
      cantidad: '1',
      unidad: 'PIEZA',
      noIdentificacion: 'ABC',
      descripcion: 'Concepto 1',
      valorUnitario: '1.23',
      importe: '1.23'
    }

    concepto_2 = {
      cantidad: '2',
      unidad: 'PIEZA',
      no_identificacion: 'DEF',
      descripcion: 'Concepto 2',
      valor_unitario: '4.56',
      importe: '9.12'
    }

    impuestos = {
      totalImpuestosTrasladados: '12.00'
    }

    traslado_1 = {
      impuesto: 'IVA',
      tasa: '16.00',
      importe: '12.00'
    }

    @comprobante = Cofidin::Comprobante.new
    @comprobante.atributos_sat = atributos_comprobante
    @comprobante.emisor.atributos_sat = atributos_emisor
    @comprobante.emisor.domicilio_fiscal.atributos_sat = domicilio_emisor
    @comprobante.receptor.atributos_sat = receptor
    @comprobante.receptor.domicilio.atributos_sat = domicilio_receptor
    concepto = Cofidin::Concepto.new
    concepto.atributos_sat = concepto_1
    @comprobante.conceptos << concepto
    concepto = Cofidin::Concepto.new
    concepto.atributos_sat = concepto_2
    @comprobante.conceptos << concepto
    @comprobante.impuestos.atributos_sat = impuestos
    traslado = Cofidin::Traslado.new
    traslado.atributos_sat = traslado_1
    @comprobante.impuestos.traslados << traslado
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
