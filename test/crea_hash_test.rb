require 'test_helper'

class CreaHashTest < MiniTest::Spec
  before do
    @sello = "ZzbW9uf+KF+5dhVKYxLzxYExWZGIQotjUUKH2wGCa0DRnTdcyaeBV8l4yeNxFAmc9YkyM9l0smv61l67vntSmxXFnT3aiXeltKMd0qDQUshCRBk5WEy8gkbYFs61goKX6zRl4CYtsXdGploQ6OKLQavWlADrYxZzRBv+j0wM/qk="
    @certificado = "MIIEjTCCA3WgAwIBAgIUMDAwMDEwMDAwMDAzMDMwMjAzNTkwDQYJKoZIhvcNAQEFBQAwggGKMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMR8wHQYJKoZIhvcNAQkBFhBhY29kc0BzYXQuZ29iLm14MSYwJAYDVQQJDB1Bdi4gSGlkYWxnbyA3NywgQ29sLiBHdWVycmVybzEOMAwGA1UEEQwFMDYzMDAxCzAJBgNVBAYTAk1YMRkwFwYDVQQIDBBEaXN0cml0byBGZWRlcmFsMRQwEgYDVQQHDAtDdWF1aHTDqW1vYzEVMBMGA1UELRMMU0FUOTcwNzAxTk4zMTUwMwYJKoZIhvcNAQkCDCZSZXNwb25zYWJsZTogQ2xhdWRpYSBDb3ZhcnJ1YmlhcyBPY2hvYTAeFw0xNDAyMjAyMDA0MjRaFw0xODAyMjAyMDA0MjRaMIHZMSkwJwYDVQQDEyBBTFNBQyBJTk1PQklMSUFSSUEgUyBERSBSTCBERSBDVjEpMCcGA1UEKRMgQUxTQUMgSU5NT0JJTElBUklBIFMgREUgUkwgREUgQ1YxKTAnBgNVBAoTIEFMU0FDIElOTU9CSUxJQVJJQSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBSU4xNDAyMTBONzcgLyBTQUNBNzIxMDE4VEI0MR4wHAYDVQQFExUgLyBTQUNBNzIxMDE4SERGTVNMMDIxDzANBgNVBAsTBlVOSURBRDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAoL1BkI0lOyTJm+lULid/owxty4SoynTLQn1PVlgIIQPA+VIUAtkj+e5rONFSuF7SK9WMC/ycuh+LlDP7CkyK1qhjf+aeq3wqCtbtUed9B01l+U8/mRZ+YK3m+aFccLBj87JbbhTLEU03czPKmj+xsLUyIkE5IPSrERaKxVL/A98CAwEAAaMdMBswDAYDVR0TAQH/BAIwADALBgNVHQ8EBAMCBsAwDQYJKoZIhvcNAQEFBQADggEBAEvCOdRe4B5yXa6B976JHkZ2W4/oF6F5/5nfiebd02u9NGKi03iCNmPqk7jg8OhNFSAW5u7UoTrdJPV3r5mJ/lrKba+5Nvhq2fqch0l/TWyO0FAKiIOofV8wVVm9HPAhxz0J39oOQE8ZDUj82eRzvbRHvmXTjE3b0hrJtRef/W1Mi63SVVPpjzkr/yo0yYk5OhIOPv4iVEl95qhla082+QlHFv505LhlPa5k+U3OzOnrsSLbDnZCI92+eoXkx+gvxR0Ve05K1e37ayD2aEL987GxWNWiUZ2dIVyscVj7BMiWMkbIQUwGSIi9tDodju7lKkEH8acttQusbnRkXaLpqQA="
    @sello_sat = "TMEDZkoAIBdsj2Guy/z/u/YEmeV3D9vovhHt01jnwJ9Tdfoyub6rWojTPoBGWUGLMj3w2KhuLtaX9IoQPbuQDxnO0kx1KWe0nMma7T6w56kksq1ge8K0KnNb4mYkuCJ0Tkci/qAI8wRrD5k0uKCDd/0CUaR18RqMKRdzrZrOnIjbQ6Vuu/zm9sXP/CR+IMg2BO469qapOGMB4XHJ+dXq3jqTesRGcmhTz2cmootCoE8KT4T3KSuxdBkuHhVLNpQ4QyINyuq7l9lPRYdr92Dz+EkOeMLqpM1BblmGZNx4KWOzvi7X61ag2pXEs7nD2qfocw4G7dc5v+BA79zyPUPuWw=="
    @xml = File.read('test/fixtures/alsac.xml')
    @result, @hash = Cofidin33::CreaHash.call xml: @xml
  end

  it 'creates a hash from an xml invoice' do
    @result.must_equal :ok
  end

  it 'has the right values for comprobante' do
    @hash[:version].must_equal '3.3'
    @hash[:serie].must_equal 'A'
    @hash[:folio].must_equal '7164'
    @hash[:fecha].must_equal '2017-11-01T10:25:00'
    @hash[:sello].must_equal @sello
    @hash[:forma_pago].must_equal '99'
    @hash[:no_certificado].must_equal '00001000000303020359'
    @hash[:certificado].must_equal @certificado
    @hash[:condiciones_de_pago].must_be_nil
    @hash[:sub_total].must_equal '800.00'
    @hash[:descuento].must_be_nil
    @hash[:moneda].must_equal 'MXN'
    @hash[:tipo_cambio].must_equal '1'
    @hash[:total].must_equal '928.00'
    @hash[:tipo_de_comprobante].must_equal 'I'
    @hash[:metodo_pago].must_equal 'PUE'
    @hash[:lugar_expedicion].must_equal '53100'
    @hash[:confirmacion].must_be_nil
    @hash[:cfdi_relacionados].must_equal []
  end

  it 'has the right values for emisor' do
    emisor = @hash[:emisor]
    emisor[:rfc].must_equal 'AIN140210N77'
    emisor[:nombre].must_equal 'ALSAC INMOBILIARIA S DE RL DE CV'
    emisor[:regimen_fiscal].must_equal '601'
  end

  it 'has the right values for receptor' do
    receptor = @hash[:receptor]
    receptor[:rfc].must_equal 'VCO980224GM7'
    receptor[:nombre].must_equal 'VIRTUS CONSULTORES S.A DE C.V'
    receptor[:residencia_fiscal].must_be_nil
    receptor[:num_reg_id_trib].must_be_nil
    receptor[:uso_cfdi].must_equal 'G03'
  end

  it 'has the the right concepto count' do
    conceptos = @hash[:conceptos]
    conceptos.count.must_equal 1
  end

  it 'has the right values for concepto' do
    concepto = @hash[:conceptos][0]
    concepto[:clave_prod_serv].must_equal '80161504'
    concepto[:no_identificacion].must_equal 'SER'
    concepto[:cantidad].must_equal '1.00'
    concepto[:clave_unidad].must_equal 'E48'
    concepto[:unidad].must_equal 'Unidad de servicio'
    concepto[:descripcion].must_equal 'PRESTACION DE SERVICIOS DE OFICINA'
    concepto[:valor_unitario].must_equal '800.000000'
    concepto[:importe].must_equal '800.000000'
    concepto[:descuento].must_be_nil
    concepto[:impuestos][:traslados][0][:base].must_equal '800.000000'
    concepto[:impuestos][:traslados][0][:impuesto].must_equal '002'
    concepto[:impuestos][:traslados][0][:tipo_factor].must_equal 'Tasa'
    concepto[:impuestos][:traslados][0][:tasa_cuota].must_equal '0.160000'
    concepto[:impuestos][:traslados][0][:importe].must_equal '128.000000'
    concepto[:impuestos][:retenciones].must_equal []
  end

  it 'has the right values for impuestos' do
    impuestos = @hash[:impuestos]
    impuestos[:total_impuestos_retenidos].must_be_nil
    impuestos[:total_impuestos_trasladados].must_equal '128.00'
  end

  it 'has the right retenciones count' do
    retenciones = @hash[:impuestos][:retenciones]
    retenciones.count.must_equal 0
  end

  it 'has the right traslados' do
    traslados = @hash[:impuestos][:traslados]
    traslados.count.must_equal 1
  end

  it 'has the right values for traslado' do
    traslado = @hash[:impuestos][:traslados][0]
    traslado[:tipo].must_equal 'TRASLADO'
    traslado[:impuesto].must_equal '002'
    traslado[:tasa_cuota].must_equal '0.160000'
    traslado[:importe].must_equal '128.000000'
  end

  it 'timbre_fiscal attributes must have the right values' do
    timbre = @hash[:complemento][:timbre_fiscal]
    timbre[:version].must_equal '1.1'
    timbre[:uuid].must_equal '4D819F8B-7327-42C1-B0E1-1EB895C39DF3'
    timbre[:fecha_timbrado].must_equal '2017-11-01T10:25:01'
    timbre[:sello_cfd].must_equal @sello
    timbre[:no_certificado_sat].must_equal '00001000000404477432'
    timbre[:sello_sat].must_equal @sello_sat
  end
end
