//
//  Theme.swift
//  SimpleThemeTest
//
//  Created by Fabio Giolito on 03/12/2018.
//  Copyright © 2018 Fabio Giolito. All rights reserved.
//

import UIKit

// Inspired by Rocket.Chat
// https://github.com/RocketChat/Rocket.Chat.iOS/tree/develop/Rocket.Chat/Theme

class Theme: NSObject {
    let colorPrimary: UIColor
    let colorBackground: UIColor
    let colorText: UIColor
    let fontBody: UIFont
    let fontTitle: UIFont
    let statusBarStyle: UIStatusBarStyle
    
    init(colorPrimary: UIColor, colorBackground: UIColor, colorText: UIColor, fontBody: UIFont, fontTitle: UIFont, statusBarStyle: UIStatusBarStyle) {
        self.colorPrimary =    colorPrimary
        self.colorBackground = colorBackground
        self.colorText =       colorText
        self.fontBody =        fontBody
        self.fontTitle =       fontTitle
        self.statusBarStyle =  statusBarStyle
    }
    
    static let light = Theme(
        colorPrimary:    .blue,
        colorBackground: .white,
        colorText:       .darkText,
        fontBody:        .preferredFont(forTextStyle: .body),
        fontTitle:       .boldSystemFont(ofSize: 32),
        statusBarStyle:  .default
    )
    
    static let dark = Theme(
        colorPrimary:    .yellow,
        colorBackground: .black,
        colorText:       .white,
        fontBody:        UIFont(name: "Marker Felt", size: 20)!,
        fontTitle:       UIFont(name: "Marker Felt", size: 38)!,
        statusBarStyle:  .lightContent
    )
}

struct ThemeManager {
    // Register different Themes
    static let themes: [(title: String, theme: Theme)] = [
        ("Light", .light),
        ("Dark", .dark)
    ]
    
    // User Defaults key to store the selected theme
    static let udKey = "Theme"
    
    // Get the selected Theme title from UserDefaults
    static var themeTitle: String {
        return UserDefaults.standard.string(forKey: udKey) ?? "Light"
    }
    
    // Get the theme with that title
    static var theme = themes.first(where: {$0.title == themeTitle })?.theme ?? Theme.light {
        
        // Update UserDefaults if ThemeManager.theme changes
        didSet {
            let themeName = themes.first(where: { $0.theme == theme })?.title
            UserDefaults.standard.set(themeName, forKey: udKey)
        }
    }
}
