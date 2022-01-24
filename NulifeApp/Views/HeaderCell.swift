//
//  HeaderCell.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var optionBtn: UIButton!
    @IBOutlet weak var segmentControl: CustomiseSegmentControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func optionbtnAction(_ sender: UIButton) {
    }
}
