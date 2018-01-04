module Cofidin33
  require 'openssl'
  require 'base64'

  class GeneraSello
    def self.call(cadena_original, llave_privada)
      key_pem = OpenSSL::PKey::RSA.new llave_privada
      cadena_firmada = key_pem.sign OpenSSL::Digest::SHA256.new, cadena_original
      base_64 = Base64::encode64 cadena_firmada
      sello = base_64.gsub(/\n/, '')
    end
  end
end
