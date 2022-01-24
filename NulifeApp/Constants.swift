//
//  Constants.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import Foundation
import UIKit
enum RequiredCells: String {
    case header = "HeaderCell"
    case title = "TitleCell"
    case sessionSchedule = "SessionScheduledCell"
    case toDo = "ToDoCell"
    case services = "ServicesCell"
}
struct ServicesData {
    let serviceTitle: String?
    let serviceDescription: String?
    let imageName: String?
}
protocol DataFetchDelegate {
    func dataFetch(data: String?)
}
extension UIView {
    func shadowEffect() {
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.opaqueSeparator.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 20
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        self.layer.shouldRasterize = true
    }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
