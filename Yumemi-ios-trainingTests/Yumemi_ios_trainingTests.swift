//
//  Yumemi_ios_trainingTests.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import XCTest
@testable import Yumemi_ios_training

class Yumemi_ios_trainingTests: XCTestCase {
    var vc = WeatherViewController.instantiate(
        areaData: AreaData(
            weatherUIData: WeatherUIData(weatherInfo: WeatherInfo(maxTemp: 30, minTemp: 0, weather: .sunny)),
            area: "tokyo")
    )
    var client: StubWeatherClient!
    
    override func setUpWithError() throws {
        client = StubWeatherClient()
        vc.repository = WeatherRepository(weatherClient: client)
        vc.loadViewIfNeeded()
    }
    
    func test_渡された天気予報が正しく表示されること() {
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "sunny").withTintColor(.red))
        XCTAssertEqual(self.vc.maxTempLabel.text, "30")
        XCTAssertEqual(self.vc.minTempLabel.text, "0")
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let weatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .sunny)
        client.dummyInfraWeatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        executionLowTask(exp: makeExpectation(funcName: #function)) {
            XCTAssertEqual(self.vc.weatherImageView.image!,
                           #imageLiteral(resourceName: "sunny").withTintColor(.red))
        }
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
        let weatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .cloudy)
        client.dummyInfraWeatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        executionLowTask(exp: makeExpectation(funcName: #function)) {
            XCTAssertEqual(self.vc.weatherImageView.image!,
                           #imageLiteral(resourceName: "cloudy").withTintColor(.gray))
        }
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
        let weatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        client.dummyInfraWeatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        executionLowTask(exp: makeExpectation(funcName: #function)) {
            XCTAssertEqual(self.vc.weatherImageView.image!,
                           #imageLiteral(resourceName: "rainy").withTintColor(.blue))
        }
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
        let weatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .sunny)
        client.dummyInfraWeatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        executionLowTask(exp: makeExpectation(funcName: #function)) {
            XCTAssertEqual(self.vc.maxTempLabel.text, "10")
        }
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
        let weatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .sunny)
        client.dummyInfraWeatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        executionLowTask(exp: makeExpectation(funcName: #function)) {
            XCTAssertEqual(self.vc.minTempLabel.text, "5")
        }
    }
    
    private func executionLowTask(exp: XCTestExpectation, _ handler: @escaping () -> Void) {
        Task(priority: .low) {
            DispatchQueue.main.async {
                handler()
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    private func makeExpectation(funcName: String) -> XCTestExpectation {
        XCTestExpectation(description: "\(funcName)がタイムアウト")
    }
}
