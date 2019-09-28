//
//  OrientationInfo.swift
//  WolfCore_iOS
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

#if os(iOS)
import UIKit
import WolfCore

extension UIInterfaceOrientationMask: CustomStringConvertible {
    public var description: String {
        let joiner = Joiner(left: "[", separator: ",", right: "]")
        if self.contains(.portrait) {
            joiner.append("portrait")
        }
        if self.contains(.landscapeLeft) {
            joiner.append("landscapeLeft")
        }
        if self.contains(.landscapeRight) {
            joiner.append("landscapeRight")
        }
        if self.contains(.portraitUpsideDown) {
            joiner.append("portraitUpsideDown")
        }
        return joiner.description
    }
}

extension UIDeviceOrientation: CustomStringConvertible {
    public var description: String {
        let s: String
        switch self {
        case .unknown:
            s = "unknown"
        case .portrait:
            s = "portrait"
        case .portraitUpsideDown:
            s = "portraitUpsideDown"
        case .landscapeLeft:
            s = "landscapeLeft"
        case .landscapeRight:
            s = "landscapeRight"
        case .faceUp:
            s = "faceUp"
        case .faceDown:
            s = "faceDown"
        @unknown default:
            fatalError()
        }
        return "[\(s)]"
    }
}

extension UIDevice {
    public func force(toOrientation orientation: UIInterfaceOrientation) {
        setValue(orientation.rawValue, forKey: "orientation")
    }

    public static var currentOrientation: UIDeviceOrientation {
        let device = UIDevice.current
        device.beginGeneratingDeviceOrientationNotifications()
        defer { device.endGeneratingDeviceOrientationNotifications() }
        return device.orientation
    }
}

public func forcePhoneToPortraitOrientation() {
    if isPhone {
        UIDevice.current.force(toOrientation: .portrait)
    }
}

public func forceToPortraitOrientation() {
    UIDevice.current.force(toOrientation: .portrait)
}
#endif
