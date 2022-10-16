import XCTest
@testable import MyLibrary

class WeatherServiceImplTests: XCTestCase{
    func testWeatherAPIandMockGetTemperature() async {
        // Given
        let weatherService = WeatherServiceImpl(
            serviceType: "weatherAPI"
        )
        
        // When
        let temp = try! await weatherService.getTemperature()
        print("temp = ", temp)
            
        // Then
        XCTAssertNotNil(temp)
        XCTAssert(type(of: temp) == Int.self)
        
    }
    
    func testMockServerGetTemperature() async {
        // Given
        let weatherService = WeatherServiceImpl(
            serviceType: "mockServer"
        )
        
        // When
        let temp = try! await weatherService.getTemperature()
        print("temp = ", temp)
            
        // Then
        XCTAssertNotNil(temp)
        XCTAssert(type(of: temp) == Int.self)
        
    }
}
