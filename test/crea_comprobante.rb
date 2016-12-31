class CreaComprobante
  def self.call
    atributos_comprobante = {
      serie: 'B',
      folio: '1',
      fecha: '2016-12-15T17:31:46',
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

    regimen_fiscal = {
      Regimen: 'Régimen general de ley de personal morales'
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
      totalImpuestosTrasladados: '1.65'
    }

    traslado_1 = {
      impuesto: 'IVA',
      tasa: '16.00',
      importe: '1.65'
    }

    comprobante = Cofidin::Comprobante.new
    comprobante.atributos_sat = atributos_comprobante
    comprobante.emisor.atributos_sat = atributos_emisor
    comprobante.emisor.domicilio_fiscal.atributos_sat = domicilio_emisor
    comprobante.emisor.regimen_fiscal.atributos_sat = regimen_fiscal
    comprobante.receptor.atributos_sat = receptor
    comprobante.receptor.domicilio.atributos_sat = domicilio_receptor
    concepto = Cofidin::Concepto.new
    concepto.atributos_sat = concepto_1
    comprobante.conceptos << concepto
    concepto = Cofidin::Concepto.new
    concepto.atributos_sat = concepto_2
    comprobante.conceptos << concepto
    comprobante.impuestos.atributos_sat = impuestos
    traslado = Cofidin::Traslado.new
    traslado.atributos_sat = traslado_1
    comprobante.impuestos.traslados << traslado

    comprobante
  end
end
