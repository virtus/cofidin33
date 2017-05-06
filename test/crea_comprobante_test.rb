require 'test_helper'

class CreaComprobanteTest < Minitest::Spec
  before do
    @params = {
      serie: 'B',
      folio: '1',
      fecha: '2016-12-15T17:31:46',
      forma_de_pago: 'Pago en una sola exhibición',
      no_certificado: '12345678901234567890',
      sub_total: '10.35',
      total: '12.00',
      tipo_de_comprobante: 'ingreso',
      metodo_de_pago: '03',
      lugar_expedicion: 'Naucalpan, Estado de México',

      emisor: {
        rfc: 'VCO980224GM7',
        nombre: 'Virtus Consultores, S.A. de C.V.',
        domicilio_fiscal: {
          calle: 'Valle de Solís',
          no_exterior: '33',
          colonia: 'El Mirador',
          codigo_postal: '53050',
          municipio: 'Naucalpan',
          estado: 'México',
          pais: 'México'
        },
        regimen_fiscal: {
          regimen: 'Régimen general de ley de personal morales'
        }
      },

      receptor: {
        rfc: 'CRM6702109K6',
        nombre: 'Cruz Roja Mexicana, I.A.P.',
        domicilio: {
          calle: 'Juan Luis Vives',
          no_exterior: '2002',
          no_interior: 'A',
          colonia: 'Los Morales Polanco',
          codigo_postal: '11510',
          municipio: 'Miguel Hidalgo',
          estado: 'Ciudad de México',
          pais: 'México'
        }
      },

      conceptos: [
        {
          cantidad: '1',
          unidad: 'PIEZA',
          no_identificacion: 'ABC',
          descripcion: 'Concepto 1',
          valor_unitario: '1.23',
          importe: '1.23'
        },
        {
          cantidad: '2',
          unidad: 'PIEZA',
          no_identificacion: 'DEF',
          descripcion: 'Concepto 2',
          valor_unitario: '4.56',
          importe: '9.12'
        }
      ],

      impuestos: {
        total_impuestos_trasladados: '1.65',
        traslados: [
          {
            impuesto: 'IVA',
            tasa: '16.00',
            importe: '1.65'
          }
        ]
      }
    }
  end

  it 'crea un comprobante a partir de un hash' do
    comprobante = Cofidin33::CreaComprobante.call(@params)
    comprobante.must_be_instance_of Cofidin33::Comprobante
    comprobante.emisor.must_be_instance_of Cofidin33::Emisor
    comprobante.receptor.must_be_instance_of Cofidin33::Receptor
    comprobante.conceptos.length.must_equal 2
    comprobante.conceptos[0].must_be_instance_of Cofidin33::Concepto
    comprobante.impuestos.must_be_instance_of Cofidin33::ImpuestosComprobante
    comprobante.impuestos.traslados[0].must_be_instance_of Cofidin33::TrasladoComprobante
  end
end
