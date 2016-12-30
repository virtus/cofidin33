require 'test_helper'

class GeneraCadenaOriginalTest < Minitest::Spec

  it 'genera la cadena original' do
    atributos_comprobante = {
      serie: 'A',
      folio: '1',
      fecha: '2016-12-15T17:31:46',
      tipoDeComprobante: 'ingreso',
      formaDePago: 'Pago en una sola exhibición',
      subTotal: '10.00'
    }
    atributos_emisor = {
      rfc: 'VCO980224GM7',
      nombre: 'Virtus Consultores, S.A. de C.V.'
    }
    atributos_domicilio_fiscal = {
      calle: 'Valle de Solís',
      noExterior: '33',
      colonia: 'El Mirador',
      municipio: 'Naucalpan',
      estado: 'México',
      pais: 'México',
      codigoPostal: '53050'
    }
    comprobante = Cofidin::Comprobante.new
    comprobante.atributos_sat = atributos_comprobante
    comprobante.emisor.atributos_sat = atributos_emisor
    comprobante.emisor.domicilio_fiscal.atributos_sat = atributos_domicilio_fiscal
    cadena_original = Cofidin::GeneraCadenaOriginal.call comprobante
    cadena_original.must_equal '||3.2|2016-12-15T17:31:46|ingreso|Pago en una sola exhibición|10.00|VCO980224GM7|Virtus Consultores, S.A. de C.V.|Valle de Solís|33|El Mirador|Naucalpan|México|México|53050||'
  end
end
