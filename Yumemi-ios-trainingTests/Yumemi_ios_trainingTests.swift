//
//  Yumemi_ios_trainingTests.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import XCTest
@testable import Yumemi_ios_training

class Yumemi_ios_trainingTests: XCTestCase {
    var vc: ViewController!
    var presenter: MockMainPresenter!
    
    override func setUpWithError() throws {
        vc = ViewController.instantiate()
        vc.loadViewIfNeeded()
        presenter = MockMainPresenter()
        vc.inject(presenter: presenter)
        presenter.view = vc
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        let weatherData = WeatherUIDataConverter.convert(weatherInfo: data)
        
        presenter.data = data
        waitFetchData(funcName: #function, timeout: 5.0) {
            self.vc.onTapReloadButton("")
        }
        XCTAssertEqual(self.vc.weatherImageView.image!, weatherData.image)
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .cloudy)
        let weatherData = WeatherUIDataConverter.convert(weatherInfo: data)
        
        presenter.data = data
        waitFetchData(funcName: #function, timeout: 5.0) {
            self.vc.onTapReloadButton("")
        }
        XCTAssertEqual(self.vc.weatherImageView.image!, weatherData.image)
        
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .rainy)
        let weatherData = WeatherUIDataConverter.convert(weatherInfo: data)
        
        presenter.data = data
        waitFetchData(funcName: #function, timeout: 5.0) {
            self.vc.onTapReloadButton("")
        }
        XCTAssertEqual(self.vc.weatherImageView.image!, weatherData.image)
        
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        let weatherData = WeatherUIDataConverter.convert(weatherInfo: data)
        
        presenter.data = data
        waitFetchData(funcName: #function, timeout: 5.0) {
            self.vc.onTapReloadButton("")
        }
        XCTAssertEqual(self.vc.maxTempLabel.text!, weatherData.maxTemp)
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        let weatherData = WeatherUIDataConverter.convert(weatherInfo: data)
        
        presenter.data = data
        waitFetchData(funcName: #function, timeout: 5.0) {
            self.vc.onTapReloadButton("")
        }
        XCTAssertEqual(self.vc.minTempLabel.text!, weatherData.minTemp)
    }
    
    private func waitFetchData(funcName: String, timeout: TimeInterval, handler: @escaping () -> Void) {
        let exp = XCTestExpectation(description: "\(funcName)の待機がタイムアウトしました")
        DispatchQueue.global().async {
            handler()
            exp.fulfill()
        }
        wait(for: [exp], timeout: timeout)
    }
}
