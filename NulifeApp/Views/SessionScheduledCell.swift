//
//  SessionScheduledCell.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit

class SessionScheduledCell: UITableViewCell {

    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var calenderBtn: UIButton!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var scheduledSessionList: UITableView!
    var parent: UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        parentView.shadowEffect()
        scheduledSessionList.delegate = self
        scheduledSessionList.dataSource = self
        registerCell()
    }
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        scheduledSessionList.reloadData()
        let size = CGSize(width: targetSize.width,
                          height: scheduledSessionList.frame.origin.y + scheduledSessionList.contentSize.height)
        return size

    }
    private func registerCell() {
        scheduledSessionList.register(UINib(nibName: "SessionDetailCell", bundle: nil), forCellReuseIdentifier: "SessionDetailCell")
    }
    
    @IBAction func calenderBtnAction(_ sender: UIButton) {
        let vc = parent?.storyboard?.instantiateViewController(withIdentifier: "DatePickerController") as! DatePickerController
        vc.delegate = self
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .overFullScreen
        parent?.present(navigationController, animated: true, completion: nil)
        print("Calender Tapped")
    }
}
extension SessionScheduledCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionDetailCell", for: indexPath) as? SessionDetailCell
        else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension SessionScheduledCell: DataFetchDelegate {
    func dataFetch(data: String?) {
        dateLabel.text = data
    }
}
