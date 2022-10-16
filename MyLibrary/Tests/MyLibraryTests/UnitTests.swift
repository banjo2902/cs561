import XCTest
@testable import MyLibrary

class WeatherServiceUnitTests: XCTestCase{
    func testIsWeatherDecodable() async {
        // Given
        let jsonString = """
                         {
                            "main":
                            {
                                "temp": 37.13215
                            }
                         }
                         """
        
        let jsonData = Data(jsonString.utf8)
        let jsonDecoder = JSONDecoder()
        
        // When
        let weather = try! jsonDecoder.decode(Weather.self, from: jsonData)
        
        // Then
        print("res = ", weather.main.temp)
        XCTAssertNotNil(weather)
        XCTAssert(type(of: weather.main.temp) == Double.self)
    }
}
