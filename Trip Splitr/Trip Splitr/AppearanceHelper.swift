//
//  AppearanceHelper.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit


enum AppearanceHelper {
    
    static var lightBlue = UIColor(displayP3Red: 162 / 255, green: 176 / 255, blue: 187 / 255, alpha: 1.0)
    static var mediumBlue = UIColor(displayP3Red: 115 / 255, green: 136 / 255, blue: 150 / 255, alpha: 1.0)
    static var darkBlue = UIColor(displayP3Red: 54 / 255, green: 82 / 255, blue: 100 / 255, alpha: 1.0)
    static var lightGray = UIColor(displayP3Red: 241 / 255, green: 241 / 255, blue: 241 / 255, alpha: 1.0)
    static var white = UIColor(displayP3Red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0)
    
    
    static func setAppearance() {
        
        UINavigationBar.appearance().barTintColor = mediumBlue
        UINavigationBar.appearance().tintColor = darkBlue
        UIBarButtonItem.appearance().tintColor = darkBlue
        
        let altTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 54 / 255, green: 82 / 255, blue: 100 / 255, alpha: 1.0)]
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 54 / 255, green: 82 / 255, blue: 100 / 255, alpha: 1.0)]
        
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        UISegmentedControl.appearance().setTitleTextAttributes(textAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(altTextAttributes, for: .normal)
        
//        UITextField.appearance().tintColor = mediumBlue
//        UITextView.appearance().tintColor = lightBlue
    }
    
    
    //    static func dancingFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
    //        let font = UIFont(name: "Mervale Script" , size: pointSize)!
    //        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    //    }
    
    
    
    
}
