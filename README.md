# Cofidin33

Genera un XML válido, genera la cadena original y sella un CFDI versión 3.3

## Instalación

Agrega esta línea en el Gemfile de tu aplicación:

```ruby
gem 'cofidin33'
```

Luego ejecuta el comando:

    $ bundle

O instálalo manualmente:

    $ gem install cofidin33

## Descripción

El objetivo de esta gema es evitar el manejo de XML usando en su lugar un hash.

Esta gema hace lo siguiente:
* Genera el XML que cumple con los estándares del SAT a partir de un hash.
* Genera un hash a partir de un XML
* Sella el XML con el certificado del emisor

Esta gema no timbra el comprobante, solamente genera un XML listo para timbrar.

Esta gema no realiza ningún cálculo ni redondeo, utiliza directamente los datos que se pasaron cómo parámetros. Por ello, todos los datos que correspondan a cantidades numéricas deben pasarse como strings con el número de decimales requeridos.

## Uso

```ruby
# Crea comprobante en XML
xml = Cofidin33::CreaComprobante.call(hash: invoice_hash)

# Sella un comprobante
xml_sellado = Cofidin33::SellaComprobante.call(xml: xml, certificado: certificado, llave_privada: llave_privasa, fecha_hora: fecha_hora)

# Convierte el XML a un hash
hash = Cofidin33::CreaHash.call(xml: xml)

```

## Licencia

Esta gema está disponible como código abierto de acuerdo con los términos de la [Licencia MIT](http://opensource.org/licenses/MIT).
