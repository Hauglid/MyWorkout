
import UIKit

final class AppThemeProvider: ThemeProvider {
	static let shared: AppThemeProvider = .init()

	private var theme: SubscribableValue<AppTheme>
	private var availableThemes: [AppTheme] = [.light, .dark]

	var currentTheme: AppTheme {
		get {
			return theme.value
		}
		set {
			setNewTheme(newValue)
		}
	}

	init() {
		theme = SubscribableValue<AppTheme>(value: .light)
	}

	private func setNewTheme(_ newTheme: AppTheme) {
		let window = UIApplication.shared.delegate!.window!!
		UIView.transition(
			with: window,
			duration: 0.3,
			options: [.transitionCrossDissolve],
			animations: {
				self.theme.value = newTheme
			},
			completion: nil
		)
	}

	func subscribeToChanges(_ object: AnyObject, handler: @escaping (AppTheme) -> Void) {
		theme.subscribe(object, using: handler)
	}
}

extension Themed where Self: AnyObject {
    var themeProvider: AppThemeProvider {
        return AppThemeProvider.shared
    }
}
