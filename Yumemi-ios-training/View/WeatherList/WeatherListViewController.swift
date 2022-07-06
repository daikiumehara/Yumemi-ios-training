//
//  ListViewController.swift
//  Yumemi-ios-training
//
//  Created by 梅原 奈輝 on 2022/05/16.
//

import UIKit

protocol WeatherListViewProtocol: AnyObject {
    func endRefreshing()
    func updateList(data: [AreaData])
    func showErrorAlert(message: String)
}

final class WeatherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var repository: WeatherRepositoryProtocol!
    private var list: [AreaData]?
    private let areas = ["Tokyo", "Sapporo", "Sendai", "Niigata",
                         "Kanazawa", "Nagoya", "Osaka", "Hiroshima",
                         "Kochi", "Fukuoka", "Kagoshima", "Naha"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "各地の天気"
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self,
                                            action: #selector(refreshControlStartRefreshing),
                                            for: .valueChanged)
        tableView.register(UINib(nibName: WeatherTableCell.className, bundle: nil),
                                forCellReuseIdentifier: WeatherTableCell.className)
        tableView.register(UINib(nibName: EmptyDataTableCell.className, bundle: nil),
                           forCellReuseIdentifier: EmptyDataTableCell.className)
        tableView.delegate = self
        tableView.dataSource = self

        fetchWeatherList()
        tableView.refreshControl?.beginRefreshing()
    }

    @objc func refreshControlStartRefreshing() {
        fetchWeatherList()
    }
    
    func fetchWeatherList() {
        Task {
            let result = await repository.syncFetchWeatherList(param: ListFetchParameter(areas: areas, date: Date()))
            tableView.refreshControl?.endRefreshing()
            switch result {
            case .success(let areaInfoList):
                list = AreaConverter.convert(areaInfoList: areaInfoList)
                tableView.reloadData()
            case .failure(let error):
                showErrorAlert(message: error.text)
            }
        }
    }

    func showErrorAlert(message: String) {
        let alert = ErrorAlertBuilder.build(message: message)
        present(alert, animated: true)
    }

    func endRefreshing() {
        tableView.refreshControl?.endRefreshing()
    }
}

extension WeatherListViewController {
    static func instantiate() -> WeatherListViewController {
        guard let initialVC = UIStoryboard(name: "WeatherList", bundle: nil).instantiateInitialViewController() as? WeatherListViewController else {
            fatalError("ListVCが見つかりませんでした。")
        }
        return initialVC
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let data = list?[indexPath.row] else { return }
        let weatherVC = WeatherViewController.instantiate(areaData: data)
        weatherVC.repository = DIContainer.makeWeatherRepository()
        navigationController?.pushViewController(weatherVC, animated: true)
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        list != nil ? 50 : 150
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = list else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyDataTableCell.className,
                                                           for: indexPath) as? EmptyDataTableCell else {
                return UITableViewCell()
            }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.className,
                                                       for: indexPath) as? WeatherTableCell else {
            fatalError("WeatherTableCellが見つかりませんでした")
        }
        cell.configure(data: list[indexPath.row])
        return cell
    }
}
