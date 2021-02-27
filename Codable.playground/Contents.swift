import UIKit

struct Horoscope : Encodable & Decodable {
    var name: String
    var date: String
}

//Nesnemizi yarattık
let horoscope1 : Horoscope = Horoscope(name: "Virgo", date: "August 23 – September 22")

//------------------------------

//Encode işlemleri için
//Encoder nesnemizi oluşturalım.
let encoder = JSONEncoder()

//Encoder'ımızın output formatına bahsettiğimiz prettyPrint'i atıyoruz.
encoder.outputFormatting = .prettyPrinted

//Ardından json tipindeki verimizi elde etmek için encoder'ı kullanrak içine nesnemizi gönderiyoruz.
//Burada do-try-catch bloklarını kullanabiliriz fakat bu işlemden emin olduğum için "try!" şeklinde kısa tuttum.
let json = try! encoder.encode(horoscope1)

//Ardından json nesnemizi görebilmemiz adına onu string'e çevirelim. Burada iki parametreli bir string methodu çalıştırıyoruz. İlk parametresi olan data'ya json verimizi, ikinci parametreye ise yazımızın "utf8" formatında olmasını istediğimizi söylüyoruz. Başka yazılar için başka formatlar tercih edilebilir.
let jsonStr = String(data: json, encoding: .utf8)

//Ardından görmek için print ile bastıralım.
print(jsonStr!)

//------------------------------

//Decode işlemleri için
//Decoder nesnemizi oluşturalım.
let decoder = JSONDecoder()

//JSON verimizi decode ederek kendi struct'ımızın tipinde bir nesne elde edelim
let decoderHoroscopeObject = try! decoder.decode(Horoscope.self, from: json)

//Daha sonrasında ekranda görelim
print("Name: " + decoderHoroscopeObject.name + "\nDate: " + decoderHoroscopeObject.date)
