//
//  DIContainer.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/06.
//

import Foundation

struct DIContainer {
    //MARK: - Presenter
<<<<<<< HEAD
    func getMainPresenter(view: WeatherViewProtocol) -> WeatherPresenterProtocol {
=======
    static func getMainPresenter(view: MainViewProtocol) -> MainPresenterProtocol {
>>>>>>> parent of 0a3c04c (mockweatherClientを使用する形にテストを変更しました)
        let useCase = self.makeWeatherUseCase()
        let presenter = WeatherPresenter(view: view,
                                      weatherUseCase: useCase)
        useCase.output = presenter
        return presenter
    }
    
    //MARK: - UseCase
    private static func makeWeatherUseCase() -> WeatherUseCaseProtocol {
        return WeatherUseCase(weatherRepository: self.makeWeatherRepository())
    }
    
    //MARK: - Repository
    private static func makeWeatherRepository() -> WeatherRepositoryProtocol {
        return WeatherRepository()
    }
}
