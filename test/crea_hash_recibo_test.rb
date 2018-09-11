require 'test_helper'

class CreaHashReciboTest < MiniTest::Spec
  before do
    @sello = "Ui2Pn7mtU7jM1AGcNQUEn/0kVm0ihKiiePBa4eREYgHn+Ux2PeGPF8xzDLdaATzwE7S/LXARzbnuYpWH0G5c2hu8x/c9sJnDWJHLGN7zQlFZcjsPcc+4su+dt6M/NJhkwdwknrZFXFTNf+FYjvOFpZ6Ybobt/THglf9ZivAl9EgjhsOIH/KOX+k4DkaOJwuFxK07Gm4nRhfgWP7VhAGQSVOvfnsNmbRz3bYqZL4TqxNv/aM/Mp9GxLJrcR8aAZlhIaFpO7e4MCh/6f8uEj/DZl0VJEgowfobfRocJD+kTHXzOsHVJb/15dQGadvc1mZCwJsoofGi9eT/UwKdQERn2Q=="
    @certificado = "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"
    @sello_sat = "HQq0FrvuRWmtOziSTgQWblv5hibApbRNj14a4ksvqq8QAjO102gMclZi3R8o8WcAlRJW1hapzV9Ik9nkdL2m9G2MJ/+Lfg7LZUY87diFEbDdPPqx34caYsLSH33vcGzox0Bf9ltn2Xe7zYOh5V4FGY4Hbar4wITrzhhAcY3FJ0Nk7moIjyeQFItg1YTOIYUzOlIIYMKlRy+Rd5/WAC2yexrQCUcDUPh/YhcO7bpqDQPZ9AjFPyPp06CPyMCQpiykKAa5sg6BxhGstM0KRjb2JzN/yoqq/G2fzaG02WhF3980Do5z1zv7foenHtMsFqpTBhPM/8UV8I4UO86ect+UyQ=="
    @xml = File.read('test/fixtures/recibo_mas_negocio.xml')
    @result, @hash = Cofidin33::CreaHash.call xml: @xml
  end

  it 'creates a hash from an xml receipt' do
    @result.must_equal :ok
  end

  it 'has the right values for comprobante' do
    @hash[:version].must_equal '3.3'
    @hash[:serie].must_equal 'R'
    @hash[:folio].must_equal '12'
    @hash[:fecha].must_equal '2018-09-09T13:11:11'
    @hash[:sello].must_equal @sello
    @hash[:forma_pago].must_be_nil
    @hash[:no_certificado].must_equal '00001000000404150280'
    @hash[:certificado].must_equal @certificado
    @hash[:condiciones_de_pago].must_be_nil
    @hash[:sub_total].must_equal '0'
    @hash[:descuento].must_be_nil
    @hash[:moneda].must_equal 'XXX'
    @hash[:tipo_cambio].must_be_nil
    @hash[:total].must_equal '0'
    @hash[:tipo_de_comprobante].must_equal 'P'
    @hash[:metodo_pago].must_be_nil
    @hash[:lugar_expedicion].must_equal '53100'
    @hash[:confirmacion].must_be_nil
    @hash[:cfdi_relacionados].must_equal []
  end

  it 'has the right values for emisor' do
    emisor = @hash[:emisor]
    emisor[:rfc].must_equal 'VCO980224GM7'
    emisor[:nombre].must_equal 'Virtus Consultores, S.A. de C.V.'
    emisor[:regimen_fiscal].must_equal '601'
  end

  it 'has the right values for receptor' do
    receptor = @hash[:receptor]
    receptor[:rfc].must_equal 'MCO000823CK3'
    receptor[:nombre].must_equal 'MasNegocio Com S.A.P.I. DE C.V.'
    receptor[:residencia_fiscal].must_be_nil
    receptor[:num_reg_id_trib].must_be_nil
    receptor[:uso_cfdi].must_equal 'P01'
  end

  it 'has the the right concepto count' do
    conceptos = @hash[:conceptos]
    conceptos.count.must_equal 1
  end

  it 'has the right values for concepto' do
    concepto = @hash[:conceptos][0]
    concepto[:clave_prod_serv].must_equal '84111506'
    concepto[:no_identificacion].must_be_nil
    concepto[:cantidad].must_equal '1'
    concepto[:clave_unidad].must_equal 'ACT'
    concepto[:unidad].must_be_nil
    concepto[:descripcion].must_equal 'Pago'
    concepto[:valor_unitario].must_equal '0'
    concepto[:importe].must_equal '0'
    concepto[:descuento].must_be_nil
    concepto[:impuestos].must_be_nil
  end

  it 'timbre_fiscal attributes must have the right values' do
    timbre = @hash[:complemento][:timbre_fiscal]
    timbre[:version].must_equal '1.1'
    timbre[:uuid].must_equal '6B87134D-E6E7-46A3-8528-1E5841BFF1D2'
    timbre[:fecha_timbrado].must_equal '2018-09-09T13:11:13'
    timbre[:sello_cfd].must_equal @sello
    timbre[:no_certificado_sat].must_equal '20001000000300022323'
    timbre[:sello_sat].must_equal @sello_sat
  end

  it 'pagos attributes must have the right values' do
    pagos = @hash[:complemento][:pagos]
    pagos[:version].must_equal '1.0'
    pagos[:pago].must_be_instance_of Array
  end

  it 'pagos attributes must have the right values' do
    pago = @hash[:complemento][:pagos][:pago][0]
    pago[:fecha_pago].must_equal '2018-08-03T12:00:00'
    pago[:forma_pago].must_equal '03'
    pago[:moneda].must_equal 'MXN'
    pago[:monto].must_equal '109040.00'
  end

  it 'documento relacionado attributes must have the right values' do
    pago = @hash[:complemento][:pagos][:pago][0]
    docto = pago[:docto_relacionado][0]
    docto[:id_documento].must_equal 'B17D0757-CE50-4CE7-9C9C-875D4191AE00'
    docto[:serie].must_equal 'B'
    docto[:folio].must_equal '255'
    docto[:moneda].must_equal 'MXN'
    docto[:metodo_pago].must_equal 'PPD'
    docto[:num_parcialidad].must_equal '1'
    docto[:imp_saldo_ant].must_equal '109040.00'
    docto[:imp_pagado].must_equal '109040.00'
    docto[:imp_saldo_insoluto].must_equal '0.00'
  end
end
