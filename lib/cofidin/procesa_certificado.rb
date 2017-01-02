module Cofidin
  require 'openssl'

  class ProcesaCertificado
    def self.call(certificado)
      cert = OpenSSL::X509::Certificate.new certificado
      serie = cert.serial.to_s(2)
      certificado = cert.to_s.gsub("-----BEGIN CERTIFICATE-----", "").gsub("-----END CERTIFICATE-----", "").gsub("\n", "")
      [serie, certificado]
    end
  end
end
