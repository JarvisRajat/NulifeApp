//
//  ServicesCell.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit

class ServicesCell: UITableViewCell {

    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var serviceIcon: UIImageView!
    @IBOutlet private weak var serviceLabel: UILabel!
    @IBOutlet private weak var serviceDescription: UILabel!
    @IBOutlet private weak var floatingIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        parentView.shadowEffect()
        serviceIcon.layer.cornerRadius = 20
        serviceIcon.layer.borderColor = UIColor.clear.cgColor
        floatingIcon.layer.cornerRadius = floatingIcon.layer.frame.size.height/2
        serviceIcon.layer.borderColor = UIColor.clear.cgColor
    }
    var dataSource: ServicesData? {
        didSet {
            serviceIcon.image = UIImage(named: dataSource?.imageName ?? "")
            serviceLabel.text = dataSource?.serviceTitle
            serviceDescription.text = dataSource?.serviceDescription
            floatingIcon.isHidden = !(dataSource?.serviceTitle ?? "" ).lowercased().contains("session")
        }
    }
}
