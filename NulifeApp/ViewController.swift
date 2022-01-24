//
//  ViewController.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private lazy var requiredCells: [RequiredCells] = [.header, .title, .sessionSchedule, .toDo, .services, .services, .services, .services, .services]
    private var servicesData = [ServicesData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupServicesData()
    }
    private func registerCell() {
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        tableView.register(UINib(nibName: "SessionScheduledCell", bundle: nil), forCellReuseIdentifier: "SessionScheduledCell")
        tableView.register(UINib(nibName: "ToDoCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")
        tableView.register(UINib(nibName: "ServicesCell", bundle: nil), forCellReuseIdentifier: "ServicesCell")
    }
    
    private func setupServicesData() {
        servicesData = [ServicesData(serviceTitle: "Sessions", serviceDescription: "Schedule or View upcoming", imageName: "session"),
                        ServicesData(serviceTitle: "Services", serviceDescription: "Special offers to help you", imageName: "services"),
                        ServicesData(serviceTitle: "Educational", serviceDescription: "Watch and learn wellness", imageName: "educational"),
                        ServicesData(serviceTitle: "Events", serviceDescription: "View and join peer events", imageName: "events"),
                        ServicesData(serviceTitle: "Communities", serviceDescription: "Get involved in groups", imageName: "communities")
        ]
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requiredCells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeReusableCell = tableView.dequeueReusableCell(withIdentifier: requiredCells[indexPath.row].rawValue)
        switch requiredCells[indexPath.row] {
        case .header:
            guard let cell = dequeReusableCell as? HeaderCell else { return UITableViewCell() }
            return cell
        case .title:
            guard let cell = dequeReusableCell as? TitleCell else { return UITableViewCell() }
            return cell
        case .sessionSchedule:
            guard let cell = dequeReusableCell as? SessionScheduledCell else { return UITableViewCell() }
            cell.parent = self
            cell.setNeedsLayout()
            return cell
        case .toDo:
            guard let cell = dequeReusableCell as? ToDoCell else { return UITableViewCell() }
            cell.parent = self
            cell.setNeedsLayout()
            return cell
        case .services:
            guard let cell = dequeReusableCell as? ServicesCell else { return UITableViewCell() }
            cell.dataSource = servicesData[indexPath.row-4]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
