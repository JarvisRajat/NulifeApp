//
//  CustomiseSegmentControl.swift
//  NulifeApp
//
//  Created by Rajat Raj on 22/01/22.
//

import Foundation
import UIKit
class CustomiseSegmentControl: UISegmentedControl {
  
  override func layoutSubviews(){
    super.layoutSubviews()
    
    let segmentStringSelected: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold),
      NSAttributedString.Key.foregroundColor : UIColor.white
    ]
    
    let segmentStringHighlited: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold),
        NSAttributedString.Key.foregroundColor : UIColor(hexString: "#324069")
    ]
    
    setTitleTextAttributes(segmentStringHighlited, for: .normal)
    setTitleTextAttributes(segmentStringSelected, for: .selected)
    setTitleTextAttributes(segmentStringHighlited, for: .highlighted)
    
    layer.masksToBounds = true
    
    if #available(iOS 13.0, *) {
        selectedSegmentTintColor = UIColor(hexString: "#324069")
    } else {
      tintColor = UIColor(hexString: "#324069")
    }
    
      backgroundColor = .clear
    
    //corner radius
    let cornerRadius = bounds.height / 2
    let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    //background
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
    layer.maskedCorners = maskedCorners

    let foregroundIndex = numberOfSegments
    if subviews.indices.contains(foregroundIndex),
      let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
      foregroundImageView.image = UIImage()
      foregroundImageView.clipsToBounds = true
      foregroundImageView.layer.masksToBounds = true
      foregroundImageView.backgroundColor = UIColor(hexString: "#324069")
      
      foregroundImageView.layer.cornerRadius = bounds.height / 2 + 5
      foregroundImageView.layer.maskedCorners = maskedCorners
    }
  }
  
  override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return false
  }
}
