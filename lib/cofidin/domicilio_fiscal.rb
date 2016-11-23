require 'dry-validation'

module Cofidin
  class DomicilioFiscal < Ubicacion
    def valida(params)
      schema = Dry::Validation.Schema do
        required(:calle).filled(:str?)
        optional(:no_exterior).filled(:str?)
        optional(:no_interior).filled(:str?)
        optional(:colonia).filled(:str?)
        optional(:localidad).filled(:str?)
        optional(:referencia).filled(:str?)
        required(:municipio).filled(:str?)
        required(:estado).filled(:str?)
        required(:pais).filled(:str?)
        required(:codigo_postal).filled(:str?)
      end

      result = schema.call(params)
    end
  end
end
