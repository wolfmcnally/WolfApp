//
//  BundleExtensions.swift
//  WolfApp
//
//  Created by Wolf McNally on 6/23/17.
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
import WolfCore

/// WolfApp.BundleClass.self can be used as an argument to the Bundle.findBundle(forClass:) method to search within this framework bundle.
public class BundleClass { }

extension Bundle {
    /// Similar to Bundle.bundleForClass, except if aClass is nil (or omitted) the main bundle is returned
    public static func findBundle(forClass aClass: AnyClass? = nil) -> Bundle {
        let bundle: Bundle
        if let aClass = aClass {
            bundle = Bundle(for: aClass)
        } else {
            bundle = Bundle.main
        }
        return bundle
    }

    public static func urlForResource(_ name: String, withExtension anExtension: String? = nil, subdirectory subpath: String? = nil) -> (Bundle) throws -> URL {
        return { bundle in
            guard let url = bundle.url(forResource: name, withExtension: anExtension, subdirectory: subpath) else {
                throw WolfAppError("Resource not found.")
            }
            return url
        }
    }
}
