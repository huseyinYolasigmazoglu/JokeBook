//
//  UIViewExtension.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 17/02/2021.
//

import Foundation
import UIKit

extension UIView {

    static func viewForSectionHeader(_ name: String) -> UIView {
        
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 30))
        
        headerView.backgroundColor = UIColor.white
        
        let sectionHeaderLabel = UILabel(frame: headerView.frame)
        sectionHeaderLabel.text = name.uppercased()
        sectionHeaderLabel.textColor = UIColor.black
        sectionHeaderLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 24)
        
        headerView.addSubview(sectionHeaderLabel)
        return headerView
    }

}
