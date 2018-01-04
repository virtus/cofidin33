module Cofidin33
  class SellaComprobante
    def self.call(comprobante:, certificado:, llave_privada:, fecha_hora:)
      comprobante.fecha = fecha_hora
      serie, cert = ProcesaCertificado.call certificado
      comprobante.no_certificado = serie
      comprobante.certificado = cert
      cadena_original = GeneraCadenaOriginal.call(comprobante)
      sello = GeneraSello.call(cadena_original, llave_privada)
      comprobante.sello = sello
      xml = GeneraXml.call(comprobante)
    end
  end
end
