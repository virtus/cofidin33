RECIBO_PAGO = {
  serie: 'R',
  folio: '8',
  fecha: '2018-09-06T15:06:53',
  forma_pago: '03',
  no_certificado: '12345678901234567890',
  sub_total: '0',
  moneda: 'XXX',
  total: '0',
  tipo_de_comprobante: 'P',
  lugar_expedicion: '53100',

  emisor: {
    rfc: 'VCO980224GM7',
    nombre: 'Virtus Consultores, SA de CV',
    regimen_fiscal: '601'
  },

  receptor: {
    rfc: 'CRM6702109K6',
    nombre: 'Cruz Roja Mexicana, IAP',
    uso_cfdi: 'G01'
  },

  conceptos: [
    {
      clave_prod_serv: '84111506',
      cantidad: '1',
      clave_unidad: 'ACT',
      descripcion: 'Pago',
      valor_unitario: '0',
      importe: '0'
    }
  ],

  complemento: {
    pagos: [
      {
        fecha_pago: '2018-09-02T12:00:00',
        forma_pago: '03',
        moneda: 'MXN',
        monto: '1234.56',
        docto_relacionado: [
          {
            id_documento: '12345',
            serie: 'A',
            folio: 12,
            moneda: 'MXN',
            metodo_pago: 'PPD',
            num_parcialidad: '1',
            imp_saldo_ant: '1234.56',
            imp_pagado: '1234.56',
            imp_saldo_insoluto: '0.00'
          }
        ]
      }
    ]
  }
}
