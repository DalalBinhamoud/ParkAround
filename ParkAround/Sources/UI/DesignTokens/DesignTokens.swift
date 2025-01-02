//
//  DesignTokens.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation
import SwiftUI

enum Colors {
    static let primary = Color("PrimaryAppColor")
    static let secondary = Color("SecondaryAppColor")
    static let background = Color("BackgroundColor")
    static let backgroundMedium = Color("BackgroundMediumColor")
    static let text = Color("TextColor")
}

enum CornerRadius {
    static let small: CGFloat = 4
    static let medium: CGFloat = 8
    static let large: CGFloat = 16
}

enum Fonts {
    static let heading = Font.system(size: 24, weight: .bold)
    static let subheading = Font.system(size: 20, weight: .bold)
    static let body = Font.system(size: 16, weight: .regular)
    static let caption = Font.system(size: 12, weight: .light)

}

enum Spacing {
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
}
