//
//  Themed.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 29/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import Foundation

/// Describes a type that can have a theme applied to it
protocol Themed {
    /// A Themed type needs to know about what concrete type the
    /// ThemeProvider is. So we don't clash with the protocol,
    /// let's call this associated type _ThemeProvider
    associatedtype _ThemeProvider: ThemeProvider
    
    /// Return the current app-wide theme provider
    var themeProvider: _ThemeProvider { get }
    
    /// This will be called whenever the current theme changes
    func applyTheme(_ theme: _ThemeProvider.Theme)
}

extension Themed where Self: AnyObject {
    /// This is to be called once when Self wants to start listening for
    /// theme changes. This immediately triggers `applyTheme()` with the
    /// current theme.
    func setUpTheming() {
        applyTheme(themeProvider.currentTheme)
        themeProvider.subscribeToChanges(self) { [weak self] newTheme in
            self?.applyTheme(newTheme)
        }
    }
}
