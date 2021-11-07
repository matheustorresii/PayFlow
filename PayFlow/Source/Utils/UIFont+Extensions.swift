//
//  UIFont+Extensions.swift
//  PayFlow
//
//  Created by Matheus Torres on 01/11/21.
//

import UIKit

enum CustomFont: String {
    case inter = "Inter"
    case lexend = "Lexend"
    
    enum Weight {
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
    }
    
    func nameFor(weight: CustomFont.Weight) -> String {
        switch weight {
        case .w100: return "\(self.rawValue)-Thin"
        case .w200: return "\(self.rawValue)-ExtraLight"
        case .w300: return "\(self.rawValue)-Light"
        case .w400: return "\(self.rawValue)-Regular"
        case .w500: return "\(self.rawValue)-Medium"
        case .w600: return "\(self.rawValue)-SemiBold"
        case .w700: return "\(self.rawValue)-Bold"
        case .w800: return "\(self.rawValue)-ExtraBold"
        case .w900: return "\(self.rawValue)-Black"
        }
    }
}

extension UIFont {
    static func custom(font: CustomFont, ofSize fontSize: CGFloat, weight: CustomFont.Weight = .w400) -> UIFont {
        let fontName = font.nameFor(weight: weight)
        guard let font = UIFont(name: fontName, size: fontSize) else {
            fatalError("Couldn't load font. Make sure font file exists. \(fontName).")
        }
        return font
    }
}
