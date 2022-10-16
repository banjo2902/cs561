import Alamofire
import Foundation

var dic: String? = ProcessInfo.processInfo.environment["WEATHER_API_KEY"]
var key = dic!

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

class WeatherServiceImpl: WeatherService {
    private var serviceType: String

    init(serviceType: String) {
        self.serviceType = serviceType
    }
    
    func getTemperature() async throws -> Int {
        var url: String = ""
        // service type:
        enum ServiceTypes: String {
            case weatherAPI
            case mockServer
            
            var code: String {
                switch self {
                case .weatherAPI: return "https://api.openweathermap.org/data/2.5/weather?q=corvallis&units=imperial&appid=\(key)"
                case .mockServer: return "http://localhost:8000/data/2.5/weather"
                }
            }
        }
        
        if let urlType = ServiceTypes(rawValue: serviceType) {
            url = urlType.code
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}

/*
#if DEBUG
extension Test {
    public func exposePrivate() -> Int {
        return self.testPrivate()
    }
}
#endif
*/
