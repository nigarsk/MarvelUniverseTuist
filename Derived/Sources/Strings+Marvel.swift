// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum MarvelStrings {
  /// Back
  public static let backButtonTitle = MarvelStrings.tr("Localizable", "back_button_title")
  /// There is no content available
  public static let marvelDetailEmpty = MarvelStrings.tr("Localizable", "marvel_detail_empty")
  /// There is no content available
  public static let marvelListEmpty = MarvelStrings.tr("Localizable", "marvel_list_empty")
  /// There is some error, please try again after sometime
  public static let marvelListError = MarvelStrings.tr("Localizable", "marvel_list_error")
  /// Marvel Universe
  public static let marvelListTitle = MarvelStrings.tr("Localizable", "marvel_list_title")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension MarvelStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = MarvelResources.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftlint:enable all
// swiftformat:enable all
