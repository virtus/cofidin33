module Cofidin
  require 'openssl'

  class AplicaCertificado
    def self.call(certificado, comprobante)
      cert = OpenSSL::X509::Certificate.new certificado
      comprobante.no_certificado = cert.serial.to_s(2)
      comprobante.certificado = cert.to_s.gsub("-----BEGIN CERTIFICATE-----", "").gsub("-----END CERTIFICATE-----", "").gsub("\n", "")
    end
  end
end
