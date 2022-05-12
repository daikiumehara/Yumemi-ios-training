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
    var presenter: MockMainPresneter!

    override func setUpWithError() throws {
        vc = ViewController.instantiate()
        vc.loadViewIfNeeded()
        presenter = MockMainPresneter()
        vc.inject(presenter: presenter)
        presenter.view = vc
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let testList = [WeatherInfo(maxTemp: 10, minTemp: 5, weather: .sunny),
                        WeatherInfo(maxTemp: 20, minTemp: -5, weather: .cloudy),
                        WeatherInfo(maxTemp: 30, minTemp: 0, weather: .rainy)]
        testList.forEach { data in
            presenter.changeWeather(weather: data)
            let weatherData = WeatherConverter.convert(data: data)
            XCTAssertEqual(vc.weatherImageView.image!, weatherData.imageData.createImage())
            XCTAssertEqual(vc.maxTempLabel.text!, weatherData.maxTemp)
            XCTAssertEqual(vc.minTempLabel.text!, weatherData.minTemp)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
