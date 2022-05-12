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

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
   
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .cloudy)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .rainy)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.maxTempLabel.text!, weatherData.maxTemp)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.maxTempLabel.text!, weatherData.maxTemp)
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.minTempLabel.text!, weatherData.minTemp)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.minTempLabel.text!, weatherData.minTemp)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
