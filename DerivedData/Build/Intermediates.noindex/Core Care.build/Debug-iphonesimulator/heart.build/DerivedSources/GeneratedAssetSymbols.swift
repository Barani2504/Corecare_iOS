import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "bluefont" asset catalog color resource.
    static let bluefont = DeveloperToolsSupport.ColorResource(name: "bluefont", bundle: resourceBundle)

    /// The "coreblue" asset catalog color resource.
    static let coreblue = DeveloperToolsSupport.ColorResource(name: "coreblue", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "avatar1" asset catalog image resource.
    static let avatar1 = DeveloperToolsSupport.ImageResource(name: "avatar1", bundle: resourceBundle)

    /// The "avatar10" asset catalog image resource.
    static let avatar10 = DeveloperToolsSupport.ImageResource(name: "avatar10", bundle: resourceBundle)

    /// The "avatar11" asset catalog image resource.
    static let avatar11 = DeveloperToolsSupport.ImageResource(name: "avatar11", bundle: resourceBundle)

    /// The "avatar12" asset catalog image resource.
    static let avatar12 = DeveloperToolsSupport.ImageResource(name: "avatar12", bundle: resourceBundle)

    /// The "avatar2" asset catalog image resource.
    static let avatar2 = DeveloperToolsSupport.ImageResource(name: "avatar2", bundle: resourceBundle)

    /// The "avatar3" asset catalog image resource.
    static let avatar3 = DeveloperToolsSupport.ImageResource(name: "avatar3", bundle: resourceBundle)

    /// The "avatar4" asset catalog image resource.
    static let avatar4 = DeveloperToolsSupport.ImageResource(name: "avatar4", bundle: resourceBundle)

    /// The "avatar5" asset catalog image resource.
    static let avatar5 = DeveloperToolsSupport.ImageResource(name: "avatar5", bundle: resourceBundle)

    /// The "avatar6" asset catalog image resource.
    static let avatar6 = DeveloperToolsSupport.ImageResource(name: "avatar6", bundle: resourceBundle)

    /// The "avatar7" asset catalog image resource.
    static let avatar7 = DeveloperToolsSupport.ImageResource(name: "avatar7", bundle: resourceBundle)

    /// The "avatar8" asset catalog image resource.
    static let avatar8 = DeveloperToolsSupport.ImageResource(name: "avatar8", bundle: resourceBundle)

    /// The "avatar9" asset catalog image resource.
    static let avatar9 = DeveloperToolsSupport.ImageResource(name: "avatar9", bundle: resourceBundle)

    /// The "base" asset catalog image resource.
    static let base = DeveloperToolsSupport.ImageResource(name: "base", bundle: resourceBundle)

    /// The "corecarelogo" asset catalog image resource.
    static let corecarelogo = DeveloperToolsSupport.ImageResource(name: "corecarelogo", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "bluefont" asset catalog color.
    static var bluefont: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .bluefont)
#else
        .init()
#endif
    }

    /// The "coreblue" asset catalog color.
    static var coreblue: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .coreblue)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "bluefont" asset catalog color.
    static var bluefont: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .bluefont)
#else
        .init()
#endif
    }

    /// The "coreblue" asset catalog color.
    static var coreblue: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .coreblue)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "bluefont" asset catalog color.
    static var bluefont: SwiftUI.Color { .init(.bluefont) }

    /// The "coreblue" asset catalog color.
    static var coreblue: SwiftUI.Color { .init(.coreblue) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "bluefont" asset catalog color.
    static var bluefont: SwiftUI.Color { .init(.bluefont) }

    /// The "coreblue" asset catalog color.
    static var coreblue: SwiftUI.Color { .init(.coreblue) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "avatar1" asset catalog image.
    static var avatar1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar1)
#else
        .init()
#endif
    }

    /// The "avatar10" asset catalog image.
    static var avatar10: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar10)
#else
        .init()
#endif
    }

    /// The "avatar11" asset catalog image.
    static var avatar11: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar11)
#else
        .init()
#endif
    }

    /// The "avatar12" asset catalog image.
    static var avatar12: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar12)
#else
        .init()
#endif
    }

    /// The "avatar2" asset catalog image.
    static var avatar2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar2)
#else
        .init()
#endif
    }

    /// The "avatar3" asset catalog image.
    static var avatar3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar3)
#else
        .init()
#endif
    }

    /// The "avatar4" asset catalog image.
    static var avatar4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar4)
#else
        .init()
#endif
    }

    /// The "avatar5" asset catalog image.
    static var avatar5: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar5)
#else
        .init()
#endif
    }

    /// The "avatar6" asset catalog image.
    static var avatar6: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar6)
#else
        .init()
#endif
    }

    /// The "avatar7" asset catalog image.
    static var avatar7: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar7)
#else
        .init()
#endif
    }

    /// The "avatar8" asset catalog image.
    static var avatar8: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar8)
#else
        .init()
#endif
    }

    /// The "avatar9" asset catalog image.
    static var avatar9: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar9)
#else
        .init()
#endif
    }

    /// The "base" asset catalog image.
    static var base: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .base)
#else
        .init()
#endif
    }

    /// The "corecarelogo" asset catalog image.
    static var corecarelogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .corecarelogo)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "avatar1" asset catalog image.
    static var avatar1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar1)
#else
        .init()
#endif
    }

    /// The "avatar10" asset catalog image.
    static var avatar10: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar10)
#else
        .init()
#endif
    }

    /// The "avatar11" asset catalog image.
    static var avatar11: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar11)
#else
        .init()
#endif
    }

    /// The "avatar12" asset catalog image.
    static var avatar12: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar12)
#else
        .init()
#endif
    }

    /// The "avatar2" asset catalog image.
    static var avatar2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar2)
#else
        .init()
#endif
    }

    /// The "avatar3" asset catalog image.
    static var avatar3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar3)
#else
        .init()
#endif
    }

    /// The "avatar4" asset catalog image.
    static var avatar4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar4)
#else
        .init()
#endif
    }

    /// The "avatar5" asset catalog image.
    static var avatar5: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar5)
#else
        .init()
#endif
    }

    /// The "avatar6" asset catalog image.
    static var avatar6: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar6)
#else
        .init()
#endif
    }

    /// The "avatar7" asset catalog image.
    static var avatar7: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar7)
#else
        .init()
#endif
    }

    /// The "avatar8" asset catalog image.
    static var avatar8: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar8)
#else
        .init()
#endif
    }

    /// The "avatar9" asset catalog image.
    static var avatar9: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar9)
#else
        .init()
#endif
    }

    /// The "base" asset catalog image.
    static var base: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .base)
#else
        .init()
#endif
    }

    /// The "corecarelogo" asset catalog image.
    static var corecarelogo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .corecarelogo)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

