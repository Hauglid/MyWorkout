

//
//  Theme.swift
//
import UIKit

enum Theme: Int {
    
    case Dark, Light

    /// BackgroundColor properties
    var backgroundColor: UIColor {
        switch self {
        case .Light:
            return UIColor.init(named: "backgroundColorLight")!
        case .Dark:
            return UIColor.init(named: "backgroundColor")!
        }
    }
    
    var primaryColor: UIColor {
        switch self {
        case .Light:
            return UIColor.init(named: "primaryColorLight")!
        case .Dark:
            return UIColor.init(named: "primaryColor")!
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .Light:
            return UIColor.init(named: "secondaryColorLight")!
        case .Dark:
            return UIColor.init(named: "secondaryColor")!
        }
    }
    
    var tertiaryColor: UIColor {
        switch self {
        case .Light:
            return UIColor.init(named: "tertiaryColorLight")!
        case .Dark:
            return UIColor.init(named: "tertiaryColor")!
        }
    }

    private enum Keys {
        static let selectedTheme = "SelectedTheme"
    }

    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .Dark
    }
    
     func apply() {
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.setValue(rawValue, forKey: Keys.selectedTheme)
        UserDefaults.standard.synchronize()
        
        // Set application tintColor
        UIApplication.shared.delegate?.window??.tintColor = primaryColor
        
        UINavigationBar.appearance().titleTextAttributes = Theme.Helper.getNavigationTitleTextAttributes()
        UINavigationBar.appearance().barTintColor = backgroundColor
        
        UITabBar.appearance().barTintColor = backgroundColor
        
        UITableView.appearance().backgroundColor = backgroundColor
        
        UILabel.appearance().textColor = primaryColor
        
        
    }
    
    struct Helper {
        static func getNavigationTitleTextAttributes() -> [NSAttributedString.Key : Any]{
            let color = Theme.current.primaryColor
            let font: UIFont = .systemFont(ofSize: 20) // UIFont(name: "Pacifico", size: 24)!
            
            return [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: color
            ]
        }
        
    }
}
