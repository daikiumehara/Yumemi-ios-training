//
//  Yumemi_ios_trainingTests.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import XCTest
@testable import Yumemi_ios_training

class Yumemi_ios_trainingTests: XCTestCase {
    var vc = WeatherViewController.instantiate()
    var presenter: MockWeatherPresenter!
    var weatherClient = StubWeatherClient()
    
    override func setUpWithError() throws {
        let useCase = WeatherUseCase(weatherRepository: WeatherRepository(weatherClient: weatherClient))
        let mockPresenter = MockWeatherPresenter(view: vc, weatherUseCase: useCase)
        useCase.output = mockPresenter
        presenter = mockPresenter
        vc.presenter = mockPresenter
        vc.loadViewIfNeeded()
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .sunny)
        
        let exp = makeExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "sunny").withTintColor(.red))
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .cloudy)
        
        let exp = makeExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "cloudy").withTintColor(.gray))
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        
        let exp = makeExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "rainy").withTintColor(.blue))
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        
        let exp = makeExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.maxTempLabel.text, "10")
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        
        let exp = makeExpectation(#function)
        presenter.exp = exp
        weatherClient.dummyInfraWeatherInfo = infraWeatherInfo
        vc.onTapReloadButton("")
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertEqual(vc.minTempLabel.text, "5")
    }
    
    private func makeExpectation(_ funcName: String) -> XCTestExpectation {
        XCTestExpectation(description: "\(funcName)のタイムアウト")
    }
}
