//
//  MockDIContainer.swift
//  Yumemi-ios-trainingTests
//
//  Created by 梅原 奈輝 on 2022/05/26.
//

import Foundation
@testable import Yumemi_ios_training

struct MockDIContainer {
    static func getMockWeatherPresenter(view: WeatherViewProtocol, weatherClient: StubWeatherClient) -> MockWeatherPresenter {
        let useCase = DIContainer.makeWeatherUseCase(
            weatherRepository: DIContainer.makeWeatherRepository(weatherClient: weatherClient)
        )
        let presenter = MockWeatherPresenter(view: view,
                                             weatherUseCase: useCase)
        useCase.output = presenter
        return presenter
    }
}
