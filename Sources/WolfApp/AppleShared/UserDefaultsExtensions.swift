//
//  UserDefaultsExtensions.swift
//  WolfApp
//
//  Created by Wolf McNally on 7/13/15.
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
import WolfLog
import ExtensibleEnumeratedName
import WolfFoundation

public let userDefaults = UserDefaults.standard

extension LogGroup {
    public static let userDefaults = LogGroup("userDefaults")
}

public struct UserDefaultsKey: ExtensibleEnumeratedName {
    public let rawValue: String

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

    // RawRepresentable
    public init?(rawValue: String) { self.init(rawValue) }
}

extension UserDefaults {
    public subscript<T: Codable>(key: UserDefaultsKey) -> T? {
        get {
            do {
                guard let data = userDefaults.object(forKey: key.rawValue) as? Data else { return nil }
                let value = try PropertyListDecoder().decode(T.self, from: data)
                logTrace("get key: \(key), value: \(value†)", group: .userDefaults)
                return value
            } catch {
                logError(error)
                return nil
            }
        }

        set {
            logTrace("set key: \(key), newValue: \(newValue†)", group: .userDefaults)
            if let newValue = newValue {
                do {
                    let data = try PropertyListEncoder().encode(newValue)
                    userDefaults.set(data, forKey: key.rawValue)
                    userDefaults.synchronize()
                } catch {
                    logError(error)
                }
            } else {
                userDefaults.removeObject(forKey: key.rawValue)
                userDefaults.synchronize()
            }
        }
    }
}
