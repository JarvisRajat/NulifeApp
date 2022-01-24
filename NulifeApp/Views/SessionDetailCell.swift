//
//  SessionDetailCell.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit

class SessionDetailCell: UITableViewCell {

    @IBOutlet weak var scheduleIcon: UIImageView!
    @IBOutlet weak var scheduleTime: UILabel!
    @IBOutlet weak var sessionWith: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        scheduleIcon.layer.cornerRadius = 10
        scheduleIcon.layer.borderColor = UIColor.clear.cgColor
    }
}
