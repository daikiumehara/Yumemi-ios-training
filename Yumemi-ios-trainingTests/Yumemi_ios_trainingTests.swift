//
//  Yumemi_ios_trainingTests.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import XCTest
@testable import Yumemi_ios_training

class Yumemi_ios_trainingTests: XCTestCase {
    var vc: WeatherViewController!
    var presenter: MockWeatherPresenter!
    var weatherClient: StubWeatherClient!
    
    override func setUpWithError() throws {
        vc = WeatherViewController.instantiate()
        weatherClient = StubWeatherClient()
        presenter = MockDIContainer.getMockWeatherPresenter(view: vc,
                                                            weatherClient: weatherClient)
        vc.loadViewIfNeeded()
        vc.presenter = presenter
        presenter.view = vc
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .sunny)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
        
        let exp = getExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.weatherImageView.image!, weatherUIData.image)
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .cloudy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
        
        let exp = getExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.weatherImageView.image!, weatherUIData.image)
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
        
        let exp = getExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.weatherImageView.image!, weatherUIData.image)
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
        
        let exp = getExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.maxTempLabel.text!, weatherUIData.maxTemp)
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
        
        let exp = getExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.minTempLabel.text!, weatherUIData.minTemp)
    }
    
    private func getExpectation(_ funcName: String) -> XCTestExpectation {
        XCTestExpectation(description: "\(funcName)のタイムアウト")
    }
}
