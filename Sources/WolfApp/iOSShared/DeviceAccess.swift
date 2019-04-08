//
//  DeviceAccess.swift
//  WolfApp
//
//  Created by Wolf McNally on 3/23/17.
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

import UIKit
import MobileCoreServices
import Photos
import CoreLocation
import WolfLocale
import WolfCore

public struct DeviceAccess {

    public enum Item: String {
        case camera
        case photoLibrary
        case locationWhenInUse
        case locationAlways

        private typealias `Self` = Item

        private static let messages: [Item: String] = [
            .camera: "Please allow #{appName} to access the camera.",
            .photoLibrary: "Please allow #{appName} to access your photo library.",
            .locationWhenInUse: "Please allow #{appName} to access your location.",
            .locationAlways: "Please allow #{appName} to access your location."
        ]

        private static let usageDescriptionKeys: [Item: String] = [
            .camera: "NSCameraUsageDescription",
            .photoLibrary: "NSPhotoLibraryUsageDescription",
            .locationWhenInUse: "NSLocationWhenInUseUsageDescription",
            .locationAlways: "NSLocationAlwaysUsageDescription"
        ]

        public var message: String {
            return Self.messages[self]! ¶ ["appName": appInfo.appName]
        }

        public var usageDescriptionKey: String {
            return Self.usageDescriptionKeys[self]!
        }

        public var hasUsageDescription: Bool {
            return appInfo.hasKey(key: usageDescriptionKey)
        }

        public func checkUsageDescription() {
            guard hasUsageDescription else {
                fatalError("No Info.plist usage description for: \(usageDescriptionKey).")
            }
        }
    }

    #if !os(tvOS)
    public static func checkCameraAuthorized(from viewController: UIViewController) -> Bool {
        Item.camera.checkUsageDescription()

        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized, .notDetermined:
            return true
        case .denied, .restricted:
            viewController.presentAccessSheet(for: .camera)
            return false
        @unknown default:
            fatalError()
        }
    }

    public static var cameraNeedsAuthorization: Bool {
        Item.camera.checkUsageDescription()

        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .notDetermined:
            return true
        default:
            return false
        }
    }
    #endif

    public static func checkPhotoLibraryAuthorized(from viewController: UIViewController) -> Bool {
        Item.photoLibrary.checkUsageDescription()

        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized, .notDetermined:
            return true
        case .denied, .restricted:
            viewController.presentAccessSheet(for: .photoLibrary)
            return false
        @unknown default:
            fatalError()
        }
    }

    public static var photoLibraryNeedsAuthorization: Bool {
        Item.photoLibrary.checkUsageDescription()

        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .notDetermined:
            return true
        default:
            return false
        }
    }

    public static func checkLocationAlwaysAuthorized(from viewController: UIViewController) -> Bool {
        Item.locationAlways.checkUsageDescription()

        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .notDetermined:
            return true
        case .authorizedWhenInUse:
            return false
        case .denied, .restricted:
            viewController.presentAccessSheet(for: .locationAlways)
            return false
        @unknown default:
            fatalError()
        }
    }

    public static var locationAlwaysNeedsAuthorization: Bool {
        Item.locationAlways.checkUsageDescription()

        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            return true
        default:
            return false
        }
    }

    public static func checkLocationWhenInUseAuthorized(from viewController: UIViewController) -> Bool {
        Item.locationWhenInUse.checkUsageDescription()

        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse, .notDetermined:
            return true
        case .denied, .restricted:
            viewController.presentAccessSheet(for: .locationWhenInUse)
            return false
        @unknown default:
            fatalError()
        }
    }

    public static var locationWhenInUseNeedsAuthorization: Bool {
        Item.locationWhenInUse.checkUsageDescription()

        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            return true
        default:
            return false
        }
    }
}

extension UIViewController {
    public func presentAccessSheet(for accessItem: DeviceAccess.Item, popoverSourceView: UIView? = nil, popoverSourceRect: CGRect? = nil, popoverBarButtonItem: UIBarButtonItem? = nil, popoverPermittedArrowDirections: UIPopoverArrowDirection = .any, didAppear: Block? = nil, didDisappear: Block? = nil) {
//        let openSettingsAction = AlertAction(title: "Open Settings"¶, identifier: "openSettings") { _ in
//            let url = URL(string: UIApplication.openSettingsURLString)!
//            if #available(iOS 10.0, *) {
//                UIApplication.shared.open(url)
//            } else {
//                UIApplication.shared.openURL(url)
//            }
//        }
//        let actions = [
//            openSettingsAction,
//            AlertAction.newCancelAction()
//        ]
//        presentSheet(withTitle: accessItem.message, identifier: "access", popoverSourceView: popoverSourceView, popoverSourceRect: popoverSourceRect, popoverBarButtonItem: popoverBarButtonItem, popoverPermittedArrowDirections: popoverPermittedArrowDirections, actions: actions, didAppear: didAppear, didDisappear: didDisappear)
    }
}
