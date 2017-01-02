require 'test_helper'

class ProcesaCertificadoTest < Minitest::Spec
  before do
    @certificado = "MIIEYTCCA0mgAwIBAgIUMjAwMDEwMDAwMDAyMDAwMDE0MjgwDQYJKoZIhvc"\
                   "NAQEFBQAwggFcMRowGAYDVQQDDBFBLkMuIDIgZGUgcHJ1ZWJhczEvMC0GA1"\
                   "UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExO"\
                   "DA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEg"\
                   "SW5mb3JtYWNpw7NuMSkwJwYJKoZIhvcNAQkBFhphc2lzbmV0QHBydWViYXM"\
                   "uc2F0LmdvYi5teDEmMCQGA1UECQwdQXYuIEhpZGFsZ28gNzcsIENvbC4gR3"\
                   "VlcnJlcm8xDjAMBgNVBBEMBTA2MzAwMQswCQYDVQQGEwJNWDEZMBcGA1UEC"\
                   "AwQRGlzdHJpdG8gRmVkZXJhbDESMBAGA1UEBwwJQ295b2Fjw6FuMTQwMgYJ"\
                   "KoZIhvcNAQkCDCVSZXNwb25zYWJsZTogQXJhY2VsaSBHYW5kYXJhIEJhdXR"\
                   "pc3RhMB4XDTEzMDUwNzE2MDEyOVoXDTE3MDUwNzE2MDEyOVowgdsxKTAnBg"\
                   "NVBAMTIEFDQ0VNIFNFUlZJQ0lPUyBFTVBSRVNBUklBTEVTIFNDMSkwJwYDV"\
                   "QQpEyBBQ0NFTSBTRVJWSUNJT1MgRU1QUkVTQVJJQUxFUyBTQzEpMCcGA1UE"\
                   "ChMgQUNDRU0gU0VSVklDSU9TIEVNUFJFU0FSSUFMRVMgU0MxJTAjBgNVBC0"\
                   "THEFBQTAxMDEwMUFBQSAvIEhFR1Q3NjEwMDM0UzIxHjAcBgNVBAUTFSAvIE"\
                   "hFR1Q3NjEwMDNNREZOU1IwODERMA8GA1UECxMIcHJvZHVjdG8wgZ8wDQYJK"\
                   "oZIhvcNAQEBBQADgY0AMIGJAoGBAKS/beUVy6E3aODaNuLd2S3PXaQre0tG"\
                   "xmYTeUxa55x2t/7919ttgOpKF6hPF5KvlYh4ztqQqP4yEV+HjH7yy/2d/+e"\
                   "7t+J61jTrbdLqT3WD0+s5fCL6JOrF4hqy//EGdfvYftdGRNrZH+dAjWWml2"\
                   "S/hrN9aUxraS5qqO1b7btlAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDV"\
                   "R0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQACPXAWZX2DuKiZVv35RS1W"\
                   "FKgT2ubUO9C+byfZapV6ZzYNOiA4KmpkqHU/bkZHqKjR+R59hoYhVdn+ClU"\
                   "IliZf2ChHh8s0a0vBRNJ3IHfA1akWdzocYZLXjz3m0Er31BY+uS3qWUtPsO"\
                   "NGVDyZL6IUBBUlFoecQhP9AO39er8zIbeU2b0MMBJxCt4vbDKFvT9i3V0Pu"\
                   "oo+kmmkf15D2rBGR+drd8H8Yg8TDGFKf2zKmRsgT7nIeou6WpfYp570WIvL"\
                   "JQY+fsMp334D05Up5ykYSAxUGa30RdUzA4rxN5hT+W9whWVGD88TD33Nw55"\
                   "uNRUcRO3ZUVHmdWRG+GjhlfsD"
  end

  it 'aplica datos del certificado al comprobante' do
    comprobante = Cofidin::Comprobante.new
    certificado = File.read('test/certificados/CSD01_AAA010101AAA.cer')
    serie, cert = Cofidin::ProcesaCertificado.call certificado
    serie.must_equal '20001000000200001428'
    cert.must_equal @certificado
  end
end
