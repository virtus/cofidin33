require 'test_helper'

class SeralizerTest < Minitest::Test
  def test_that_it_generates_xml
    comprobante = Cofidin::Comprobante.new
    serializer = Cofidin::Serializer.new

    xml = serializer.serialize comprobante
    expected = <<~XML
      <?xml version="1.0"?>
      <cfdi:Comprobante xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd"/>
    XML

    assert_equal expected, xml
  end
end
