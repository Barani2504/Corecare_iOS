//
//  ThemeColors.swift
//  Core Care
//
//  Centralised adaptive colour tokens for Light / Dark mode support.
//  Usage: Color.appBackground, Color.cardBackground, Color.textPrimary, etc.
//

import SwiftUI

// MARK: - Adaptive Semantic Colours
extension Color {

    // MARK: Backgrounds
    /// Main screen background  (white / system-dark)
    static let appBackground     = Color(UIColor.systemBackground)
    /// Slightly tinted background for sections
    static let appBackground2    = Color(UIColor.secondarySystemBackground)
    /// Card / surface colour
    static let cardBackground    = Color(UIColor.secondarySystemBackground)
    /// Grouped table-style background
    static let groupedBackground = Color(UIColor.systemGroupedBackground)

    // MARK: Text
    /// Primary label  (near-black / white)
    static let textPrimary       = Color(UIColor.label)
    /// Secondary label  (medium-grey / light-grey)
    static let textSecondary     = Color(UIColor.secondaryLabel)
    /// Tertiary label
    static let textTertiary      = Color(UIColor.tertiaryLabel)

    // MARK: Separators & Fills
    static let appSeparator      = Color(UIColor.separator)
    static let appFill           = Color(UIColor.systemFill)
    static let appSecondaryFill  = Color(UIColor.secondarySystemFill)

    // MARK: Brand
    /// CoreCare brand blue  (#2D7A9A) — asset already defined in xcassets
    static let coreBlueBrand     = Color("coreblue")
    /// Accent / action colour – brighter in dark mode
    static let appAccent         = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark
            ? UIColor(red: 0.30, green: 0.65, blue: 1.00, alpha: 1)
            : UIColor(red: 0.24, green: 0.55, blue: 1.00, alpha: 1)
    })

    // MARK: Status
    static let statusSuccess     = Color(UIColor.systemGreen)
    static let statusWarning     = Color(UIColor.systemOrange)
    static let statusError       = Color(UIColor.systemRed)
    static let statusInfo        = Color(UIColor.systemBlue)

    // MARK: Hero gradient colours
    static let heroGradientStart = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark
            ? UIColor(red: 0.14, green: 0.16, blue: 0.26, alpha: 1)
            : UIColor(red: 0.24, green: 0.55, blue: 1.00, alpha: 1)
    })
    static let heroGradientEnd   = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark
            ? UIColor(red: 0.25, green: 0.18, blue: 0.38, alpha: 1)
            : UIColor(red: 0.45, green: 0.32, blue: 0.95, alpha: 1)
    })

    /// Card shadow – invisible in dark mode (dark cards don't need shadows)
    static let cardShadow        = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark
            ? UIColor.clear
            : UIColor.black.withAlphaComponent(0.08)
    })
    
    /// Card border stroke for clear elevation in both light and dark mode
    static let cardBorder        = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark
            ? UIColor.white.withAlphaComponent(0.12)
            : UIColor.black.withAlphaComponent(0.06)
    })
}

// MARK: - Adaptive Gradient Helpers
extension LinearGradient {

    /// Main hero gradient (blue→purple), adapts to dark mode
    static var appHero: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [.heroGradientStart, .heroGradientEnd]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }

    /// Splash / landing screen background gradient
    static var appSplash: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.appBackground,
                Color.appAccent.opacity(0.05),
                Color(UIColor.systemCyan).opacity(0.08)
            ]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }

    /// AI / teal action gradient
    static var appAI: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(UIColor { tc in
                    tc.userInterfaceStyle == .dark
                        ? UIColor(red: 0.10, green: 0.70, blue: 0.55, alpha: 1)
                        : UIColor(red: 0.15, green: 0.85, blue: 0.65, alpha: 1)
                }),
                Color(UIColor { tc in
                    tc.userInterfaceStyle == .dark
                        ? UIColor(red: 0.05, green: 0.58, blue: 0.45, alpha: 1)
                        : UIColor(red: 0.08, green: 0.75, blue: 0.58, alpha: 1)
                })
            ]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }
}

// MARK: - View Modifier — Adaptive Card
struct AdaptiveCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.cardBackground)
            .cornerRadius(16)
            .shadow(color: Color.cardShadow, radius: 12, x: 0, y: 6)
    }
}

extension View {
    /// Applies the standard CoreCare card appearance (adaptive background + shadow).
    func adaptiveCard() -> some View {
        modifier(AdaptiveCardModifier())
    }
}
