//
//  UINavigationBarExtensions.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 25/07/23.
//
import UIKit

public extension UINavigationBar {
    func setColors(background: UIColor, text: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = background
        appearance.titleTextAttributes = [.foregroundColor: text]
        
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
        self.compactAppearance = appearance
        self.isTranslucent = false
    }
}
