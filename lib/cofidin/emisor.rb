module Cofidin
  class Emisor
    attr_accessor :rfc
    attr_accessor :nombre

    def atributos
      {
        rfc: rfc,
        nombre: nombre
      }
    end
  end
end
