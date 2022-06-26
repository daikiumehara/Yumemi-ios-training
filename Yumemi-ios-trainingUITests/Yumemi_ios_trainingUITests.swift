//
//  Yumemi_ios_trainingUITests.swift
//  Yumemi-ios-trainingUITests
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import XCTest

class Yumemi_ios_trainingUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.launchArguments = ["UITEST"]
        app.launch()
        
        let reloadButton = app.buttons["ReloadButton"]
        reloadButton.tap()
        
//        let screenshot = try app.images["WeatherImageView"].screenshot()
//        let image = UIImage(named: "sunny")!.withTintColor(.red)
//        XCTAssertEqual(screenshot.pngRepresentation, image.pngData()!)
        
        let maxTempLabel = app.staticTexts["MaxTempLabel"]
        XCTAssertEqual(maxTempLabel.label, "20")
        
        let minTempLabel = app.staticTexts["MinTempLabel"]
        XCTAssertEqual(minTempLabel.label, "10")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
