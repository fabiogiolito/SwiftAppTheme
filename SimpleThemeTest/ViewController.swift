//
//  ViewController.swift
//  SimpleThemeTest
//
//  Created by Fabio Giolito on 03/12/2018.
//  Copyright © 2018 Fabio Giolito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonDidTap(_ sender: Any) {
        
        if ThemeManager.theme == .light {
           ThemeManager.theme = .dark
        } else {
            ThemeManager.theme = .light
        }

        applyTheme()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return ThemeManager.theme.statusBarStyle
    }
    
    func applyTheme() {
        view.backgroundColor = ThemeManager.theme.colorBackground
        
        titleLabel.font = ThemeManager.theme.fontTitle
        titleLabel.textColor = ThemeManager.theme.colorText
        titleLabel.text = "App Themes with swift"
        
        bodyLabel.font = ThemeManager.theme.fontBody
        bodyLabel.textColor = ThemeManager.theme.colorText
        bodyLabel.text = "Current theme is \(ThemeManager.themeTitle)"
        
        button.tintColor = ThemeManager.theme.colorPrimary
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
    }

}

