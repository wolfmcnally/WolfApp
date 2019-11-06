//
//  DeviceUtils.swift
//  WolfApp
//
//  Created by Wolf McNally on 6/24/17.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public var osVersion: String {
    let os = ProcessInfo().operatingSystemVersion
    return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
}

public var deviceModel: String? {
    let utsSize = MemoryLayout<utsname>.size
    var systemInfo = Data(capacity: utsSize)

    let model: String? = systemInfo.withUnsafeMutableBytes { uts in
        guard uname(uts.bindMemory(to: utsname.self).baseAddress) == 0 else { return nil }
        return String(cString: uts.bindMemory(to: CChar.self).baseAddress!)
    }

    return model
}

public var deviceName: String {
    #if os(Linux)
    return Host.current().localizedName ?? ""
    #elseif os(macOS)
    fatalError("Unimplemented.")
    #elseif os(watchOS)
    fatalError("Unimplemented.")
    #else
    return UIDevice.current.name
    #endif
}

public var mainScreenScale: CGFloat {
    #if os(iOS) || os(tvOS)
    return UIScreen.main.scale
    #elseif os(macOS)
    return NSScreen.main!.backingScaleFactor
    #else
    return 1.0
    #endif
}

#if os(macOS)
public let defaultIsFlipped = false
#else
public let defaultIsFlipped = true
#endif

#if os(iOS) || os(tvOS)
public let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
public let isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone
public let isTV: Bool = UIDevice.current.userInterfaceIdiom == .tv
public let isCarPlay: Bool = UIDevice.current.userInterfaceIdiom == .carPlay

public var defaultTintColor: UIColor = {
    return UIView().tintColor!
}()
#endif

#if os(iOS)
public let hasForceTouch = UIScreen.main.traitCollection.forceTouchCapability == .available

public func isDarkMode(_ traitEnvironment: UITraitEnvironment) -> Bool {
    if #available(iOS 12, tvOS 10, *) {
        return traitEnvironment.traitCollection.userInterfaceStyle == .dark
    } else {
        return false
    }
}

public var isDarkMode: Bool {
    return isDarkMode(UIScreen.main)
}
#endif
