//
//  ToDoDetailCell.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import UIKit

class ToDoDetailCell: UITableViewCell {

    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var toDoIcon: UIImageView!
    @IBOutlet private weak var editableCellText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        toDoIcon.layer.cornerRadius = toDoIcon.layer.frame.size.height/2
        toDoIcon.layer.borderColor = UIColor.clear.cgColor
    }
    var dataSource: String? {
        didSet {
            editableCellText.text = dataSource
        }
    }
    
}
