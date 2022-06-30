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
    
    override func setUpWithError() throws {
        presenter = MockWeatherPresenter(view: vc)
        vc.presenter = presenter
        vc.loadViewIfNeeded()
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let weatherInfo = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.weatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "sunny").withTintColor(.red))
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
        let weatherInfo = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .cloudy)
        presenter.weatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "cloudy").withTintColor(.gray))
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
        let weatherInfo = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .rainy)
        presenter.weatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        XCTAssertEqual(vc.weatherImageView.image!,
                       #imageLiteral(resourceName: "rainy").withTintColor(.blue))
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
        let weatherInfo = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .rainy)
        presenter.weatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        XCTAssertEqual(vc.maxTempLabel.text, "10")
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
        let weatherInfo = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .rainy)
        presenter.weatherInfo = weatherInfo
        vc.onTapReloadButton("")
        
        XCTAssertEqual(vc.minTempLabel.text, "5")
    }
}
