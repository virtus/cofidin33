require 'test_helper'

class ConceptoTest < Minitest::Spec
  before do
    @datos_concepto = {
      clave_prod_serv: 'clave',
      no_identificacion: 'noid',
      cantidad: '1.5',
      clave_unidad: 'CU',
      unidad: 'KILOGRAMOS',
      descripcion: 'AZUCAR',
      valor_unitario: '22.00',
      importe: '33.00',
      descuento: '3.00'
    }
  end

  describe 'cadena original' do
    it 'genera' do
      concepto = Cofidin::Concepto.new
      concepto.from_hash @datos_concepto
      cadena = concepto.cadena_original
      cadena.must_equal 'clave|noid|1.5|CU|KILOGRAMOS|AZUCAR|22.00|33.00|3.00'
    end
  end
end
