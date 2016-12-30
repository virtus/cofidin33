require 'test_helper'

class ComprobanteTest < Minitest::Spec
  before do
    @atributos_comprobante = {
      serie: 'A',
      folio: '1',
      fecha: '2016-12-15T17:31:46',
      sello: 'SELLO',
      formaDePago: 'Pago en una sola exhibición',
      noCertificado: '123456',
      certificado: 'CERTIFICADO',
      condicionesDePago: 'Contra entrega',
      SubTotal: '10.00',
      Descuento: '0.00',
      MotivoDescuento: 'MOTIVO',
      TipoCambio: '1.0000',
      Moneda: 'MXN',
      Total: '11.60',
      TipoDeComprobante: 'ingreso',
      MetodoDePago: '03',
      LugarExpedicion: 'México',
      NumCtaPago: '234567',
      FolioFiscalOrig: '345678',
      SerieFolioFiscalOrig: 'SFFO',
      FechaFolioFiscalOrig: '2016-12-15T17:31:46',
      MontoFolioFiscalOrig: '10.00'
    }
  end

  it 'genera la cadena original' do
    comprobante = Cofidin::Comprobante.new
    comprobante.atributos_sat = @atributos_comprobante
    cadena = comprobante.cadena_original
    cadena.must_equal '3.2|2016-12-15T17:31:46|ingreso|Pago en una sola exhibición|Contra entrega|10.00|0.00|1.0000|MXN|11.60|03|México|234567|345678|SFFO|2016-12-15T17:31:46|10.00'
  end
end
