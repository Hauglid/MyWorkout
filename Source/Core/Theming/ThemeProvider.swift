
import Foundation

/// Describes a type that holds a current `Theme` and allows
/// an object to be notified when the theme is changed.
protocol ThemeProvider {
	associatedtype Theme

	var currentTheme: Theme { get }

	/// Subscribe to be notified when the theme changes. Handler will be
	/// remove from subscription when `object` is deallocated.
	func subscribeToChanges(_ object: AnyObject, handler: @escaping (Theme) -> Void)
}

