//
//  DatePickerController.swift
//  NulifeApp
//
//  Created by Rajat Raj on 23/01/22.
//

import UIKit

class DatePickerController: UIViewController {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateTimeLabel: UILabel!
    var delegate: DataFetchDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        parentView.shadowEffect()
        datePicker.locale = .current
        datePicker.date = Date()
        dateSelected()
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        
    }
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: datePicker.date)
        dateTimeLabel.text = date
    }

    @IBAction func doneBtnAction(_ sender: UIButton) {
        delegate?.dataFetch(data: dateTimeLabel.text)
        dismiss(animated: true, completion: nil)
    }
}
