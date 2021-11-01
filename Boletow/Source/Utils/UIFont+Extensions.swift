//
//  UIFont+Extensions.swift
//  Boletow
//
//  Created by Matheus Torres on 01/11/21.
//

import UIKit

enum InterWeight {
    /// Thin
    case w100
    /// Extra-Light
    case w200
    /// Light
    case w300
    /// Regular
    case w400
    /// Medium
    case w500
    /// Semi-Bold
    case w600
    /// Bold
    case w700
    /// Extra-Bold
    case w800
    /// Black
    case w900
    
    var weight: UIFont.Weight {
        switch self {
        case .w100: return .thin
        case .w200: return .ultraLight
        case .w300: return .light
        case .w400: return .regular
        case .w500: return .medium
        case .w600: return .semibold
        case .w700: return .bold
        case .w800: return .heavy
        case .w900: return .black
        }
    }
}

extension UIFont {
    static func interFont(ofSize fontSize: CGFloat, weight: InterWeight = .w400) -> UIFont {
        return interFont(ofSize: fontSize, weight: weight.weight)
    }
    
    static func interFont(ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        let weightName = getWeight(weight)
        guard let interFont = UIFont(name: "Inter-\(weightName)", size: fontSize) else {
            fatalError("Couldn't load font. Make sure font file exists. Inter-\(weightName).")
        }
        return interFont
    }
    
    fileprivate static func getWeight(_ weight: UIFont.Weight) -> String {
        switch weight {
        case .black:      return "Black"
        case .bold:       return "Bold"
        case .heavy:      return "ExtraBold"
        case .ultraLight: return "ExtraLight"
        case .light:      return "Light"
        case .medium:     return "Medium"
        case .regular:    return "Regular"
        case .semibold:   return "SemiBold"
        case .thin:       return "Thin"
        default:          return "Regular"
        }
    }
}
