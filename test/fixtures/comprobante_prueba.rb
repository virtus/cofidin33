COMPROBANTE_PRUEBA = {
  serie: 'B',
  folio: '1',
  fecha: '2016-12-15T17:31:46',
  forma_pago: '03',
  no_certificado: '12345678901234567890',
  sub_total: '10.35',
  moneda: 'MXN',
  total: '12.00',
  tipo_de_comprobante: 'I',
  metodo_pago: 'PUE',
  lugar_expedicion: '53100',

  emisor: {
    rfc: 'VCO980224GM7',
    nombre: 'Virtus Consultores, S.A. de C.V.',
    regimen_fiscal: '601'
  },

  receptor: {
    rfc: 'CRM6702109K6',
    nombre: 'Cruz Roja Mexicana, I.A.P.',
    uso_cfdi: 'G01'

  },

  conceptos: [
    {
      clave_prod_serv: '43231500',
      cantidad: '1',
      unidad: 'H87',
      descripcion: 'Concepto 1',
      valor_unitario: '1.23',
      importe: '1.23',
      impuestos: [
        traslados: [
          {
            base: '1.23',
            impuesto: '002',
            tipo_factor: 'Tasa',
            tasa_o_cuota: '0.160000',
            importe: '0.1968'
          }
        ]
      ],
    },
    {
      clave_prod_serv: 81111504,
      cantidad: '2',
      unidad: 'H87',
      descripcion: 'Concepto 2',
      valor_unitario: '4.56',
      importe: '9.12',
      impuestos: [
        traslados: [
          {
            base: '9.12',
            impuesto: '002',
            tipo_factor: 'Tasa',
            tasa_o_cuota: '0.160000',
            importe: '1.4592'
          }
        ]
      ]
    }
  ],

  impuestos: {
    total_impuestos_trasladados: '1.656',
    traslados: [
      {
        impuesto: '002',
        tipo_factor: 'Tasa',
        tasa_o_cuota: '0.1600',
        importe: '1.656'
      }
    ]
  }
}
