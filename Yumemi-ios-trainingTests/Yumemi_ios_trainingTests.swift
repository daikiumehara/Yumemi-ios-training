//
//  Yumemi_ios_trainingTests.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import XCTest
@testable import Yumemi_ios_training

class Yumemi_ios_trainingTests: XCTestCase {
<<<<<<< HEAD
    var vc: WeatherViewController!
    var weatherClient: MockWeatherClient!
=======
    var vc: ViewController!
    var presenter: MockMainPresenter!
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)

    override func setUpWithError() throws {
        vc = WeatherViewController.instantiate()
        vc.loadViewIfNeeded()
<<<<<<< HEAD
        weatherClient = MockWeatherClient()
        vc.presenter = DIContainer(weatherClient: self.weatherClient).getMainPresenter(view: vc)
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .sunny)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
=======
        presenter = MockMainPresenter()
        vc.inject(presenter: presenter)
        presenter.view = vc
    }
    
    func test_天気予報がsunnyだったら_画面に晴れ画像が表示されること() {
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
    }
    
    func test_天気予報がcloudyだったら_画面に曇り画像が表示されること() {
<<<<<<< HEAD
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .cloudy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
=======
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .cloudy)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
    }
    
    func test_天気予報がrainyだったら_画面に雨画像が表示されること() {
<<<<<<< HEAD
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
=======
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .rainy)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.image)
    }
    
    func test_天気予報の最高気温がUILabelに反映されること() {
<<<<<<< HEAD
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
=======
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.maxTempLabel.text!, weatherData.maxTemp)
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.maxTempLabel.text!, weatherData.maxTemp)
    }
    
    func test_天気予報の最低気温がUILabelに反映されること() {
<<<<<<< HEAD
        let infraWeatherInfo = InfraWeatherInfo(maxTemp: 10, minTemp: 5, date: Date(), weather: .rainy)
        let weatherInfo = WeatherInfoConverter.convert(infraWeatherInfo: infraWeatherInfo)
        let weatherUIData = WeatherUIData(weatherInfo: weatherInfo)
=======
        let data = WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny)
        presenter.changeWeather(weather: data)
        let weatherData = WeatherConverter.convert(data: data)
        XCTAssertEqual(vc.minTempLabel.text!, weatherData.minTemp)
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
        
        presenter.data = data
        vc.onTapReloadButton("")
        XCTAssertEqual(vc.minTempLabel.text!, weatherData.minTemp)
    }
}
